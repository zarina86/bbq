require 'rails_helper'
require 'pundit/matchers'

RSpec.describe EventPolicy do
  subject { described_class.new(context, event) }
  let(:context) { UserContext.new(user, cookies) }
  let(:cookies) { {} }
  let(:scope) { Pundit.policy_scope(user, Event) }
  
  context "being an event's owner" do
    let(:user) { User.new }
    let(:event) { Event.new(user: user) }

    describe "#show?" do
      it { is_expected.to permit_action(:show) }
    end

    describe "#create?" do
      it { is_expected.to permit_action(:create) }
    end
    
    describe "#edit?" do
      it { is_expected.to permit_action(:edit) }
    end

    describe "#update?" do
      it { is_expected.to permit_action(:update) }
    end

    describe "#destroy?" do
      it { is_expected.to permit_action(:destroy) }
    end

    it "has access to all events" do
      expect(scope.to_a).to match_array(Event.all.to_a)
    end
  end

  context "being an event's signed_visitor" do
    let(:user) { User.new }
    let(:event) { Event.new }

    describe "#show?" do
      it { is_expected.to permit_action(:show) }
    end

    describe "#create?" do
      it { is_expected.to permit_action(:create) }
    end
    
    describe "#edit?" do
      it { is_expected.to forbid_action(:edit) }
    end

    describe "#update?" do
      it { is_expected.to forbid_action(:update) }
    end

    describe "#destroy?" do
      it { is_expected.to forbid_action(:destroy) }
    end

    it "has access to all events" do
      expect(scope.to_a).to match_array(Event.all.to_a)
    end
  end

  context "being an event's visitor" do
    let(:user) { nil }
    let(:owner) { User.new }
    let(:event) { Event.new(user: owner) }
    
    it { is_expected.to permit_action(:show) }
    it { is_expected.to forbid_actions(%i[create edit update destroy]) }

    it "has access to all events" do
      expect(scope.to_a).to match_array(Event.all.to_a)
    end
  end
end
