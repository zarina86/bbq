class SubscriptionsController < ApplicationController
  # Задаем родительский event для подписки
  before_action :set_event, only: %i[create destroy]
  
  # Задаем подписку, которую юзер хочет удалить
  before_action :set_subscription, only: :destroy

  def create
    # Болванка для новой подписки
    @new_subscription = @event.subscriptions.build(subscription_params)
    @new_subscription.user = current_user

    if @new_subscription.save
      # Если сохранилась, редиректим на страницу самого события
      redirect_to @event, notice: I18n.t('controllers.subscriptions.created')
    else 
      render 'events/show', alert: I18n.t('controllers.subscriptions.error')  
    end
  end
  
  def destroy
    message = {notice: I18n.t('controllers.subscriptions.destroyed')}
    if current_user_can_edit?(@subscription)
      @subscription.destroy
    else
      message = {alert: I18n.t('controllers.subscriptions.error')}
    end
  
    redirect_to @event, message
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_subscription
    @subscription = @event.subscriptions.find(params[:id])
  end
    
  def set_event
    @event = Event.find(params[:event_id])
  end
  
  def subscription_params
    # .fetch разрешает в params отсутствие ключа :subscription
    params.fetch(:subscription, {}).permit(:user_email, :user_name)
  end
end
