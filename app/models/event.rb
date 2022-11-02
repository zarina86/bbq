class Event < ApplicationRecord
  # Событие принадлежит юзеру
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user
  has_many :photos, dependent: :destroy
  
  validates :user, presence: true
  # Заголовок должен быть, и не может быть длиннее 255 букв
  validates :title, presence: true, length: {maximum: 255}

  # Также у события должны быть заполнены место и время проведения
  validates :address, presence: true
  validates :datetime, presence: true

  def visitors
    (subscribers + [user]).uniq
  end

  def pincode_valid?(received_pincode)
    pincode == received_pincode
  end
end
