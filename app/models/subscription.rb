class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true
  
  validates :user_name, presence: true, unless: -> { user.present? } 
 
  validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/, unless: -> { user.present? }
  
  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }

  validates :user_email, uniqueness: { scope: :event_id }, unless: -> { user.present? }
  
  validate :check_email_if_exist,  unless: -> { user.present? }

  validate :subscription_permitted, if: -> { user.present? }
  

  def user_name
    if user.present?
     user.name
    else
     super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  def check_email_if_exist
    errors.add(:user_email, :taken)  if User.where(email: user_email).exists?
  end

  def subscription_permitted
    errors.add(:base, :event_user_error) if user == event.user
  end
end
