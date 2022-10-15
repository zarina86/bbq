class ApplicationMailer < ActionMailer::Base
  if Rails.env.production?
    default from: Rails.application.credentials.dig(:mailjet, :sender)
  else
    default from: Rails.application.credentials.dig(:gmail, :user_name)
  end
  
  layout "mailer"
end
