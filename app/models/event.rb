class Event < ApplicationRecord
   # Валидируем заголовок, он не может быть длиннее 255 букв
   validates :title, presence: true, length: {maximum: 255}
   # У события должны быть заполнены место и время
   validates :address, presence: true
   validates :datetime, presence: true
end
