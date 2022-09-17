class Event < ApplicationRecord
  # Событие принадлежит юзеру
  belongs_to :user

  # Заголовок должен быть, и не может быть длиннее 255 букв
  validates :title, presence: true, length: {maximum: 255}

  # Также у события должны быть заполнены место и время проведения
  validates :address, presence: true
  validates :datetime, presence: true
end
