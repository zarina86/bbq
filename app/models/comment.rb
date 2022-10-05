class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :event, presence: true
  validates :body, presence: true
  # Это поле должно быть, только если не выполняется user.present?
  # (у объекта не задан юзер)
  validates :user_name, presence: true, unless: -> { user.present? } 
  # В качестве юзернейма, если у нас прописан юзер, мы должны брать не поле из базы, 
  # а имя этого юзера. Переопределим для этого user_name ниже:
  def user_name
    if user.present?
     user.name
    else
     super
    end
  end
end
