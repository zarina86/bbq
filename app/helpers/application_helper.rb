module ApplicationHelper
  def user_avatar(user)
    if user.avatar.attached?
      user.avatar.variant(resize_to_fit: [300, 300])
    else
      asset_path('user.png')
    end
  end

  def user_avatar_thumb(user)
    if user.avatar.attached?
      user.avatar.variant(resize_to_fit: [50, 50])
    else
      asset_path('user.png')
    end
  end

  def event_photo(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo
    else
      asset_path('event.jpg')
    end
  end

  def event_thumb(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.variant(resize_to_fill: [150, 150])
    else
      asset_path('event_thumb.jpg')
    end
  end
end
