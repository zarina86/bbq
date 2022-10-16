class EventMailer < ApplicationMailer
  def subscription(subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    
    # Берём у юзер его email
    # Subject тоже можно переносить в локали
    mail(to: event.user.email, subject: default_i18n_subject(@subscription.event.title))
  end

  def comment(comment, email)
    @comment = comment
      
    mail(to: email, subject: default_i18n_subject(title: @comment.event.title))
  end  

  def photo(photo, email)
    @photo = photo
    
    mail(to: email, subject: default_i18n_subject(title: @photo.event.title))
  end
end