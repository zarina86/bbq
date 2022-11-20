require 'open-uri'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github vkontakte]

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :photos, dependent: :destroy
  
  has_one_attached :avatar, dependent: :destroy

  validates :name, presence: true, length: {maximum: 35}

  after_commit :link_subscriptions, on: :create

  def self.from_omniauth(auth)
    user = where(email: auth.info.email).first

    return user if user.present?

    image_src = case auth.provider
                when 'github' then URI.parse(auth.info.image).open
                when 'vkontakte' then URI.parse(auth.extra.raw_info.photo_400_orig).open
                end
  
    where(uid: auth.uid, provider: auth.provider).first_or_create! do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.avatar.attach(io: image_src, filename: 'avatar.png')
      image_src.close

      user.password = Devise.friendly_token.first(16)
    end
  end

  private

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email)
      .update_all(user_id: self.id)
  end
end
