class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
   
  def github
    authorize_service("Github")  
  end

  def vkontakte
    authorize_service("VK")  
  end
 

  private

  def authorize_service(social_service)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      flash[:notice] = I18n.t("devise.omniauth_callbacks.success", kind: social_service)
      sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
      
    else
      flash[:error] = I18n.t(
        "devise.omniauth_callbacks.failure",
        kind: social_service,
        reason: "authentication error"
      )

      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end

  def failure
    redirect_to root_path, alert: "Failure. Please try again"
  end
end