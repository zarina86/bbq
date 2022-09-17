class AddUserRefToEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :user, index: true, foreign_key: true
  end
end
