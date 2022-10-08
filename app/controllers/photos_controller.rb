class PhotosController < ApplicationController
  before_action :set_event, only: %i[create destroy]

  before_action :set_photo, only: :destroy

  def create
    # Создаем новую фотографию у нужного события @event
    @new_photo = @event.photos.build(photo_params)

    # Проставляем у фотографии пользователя
    @new_photo.user = current_user

    if @new_photo.save
      # Если фотка сохранилась, редиректим на событие с сообщением
      redirect_to @event, notice: I18n.t('controllers.photos.created')
    else
      # Если нет — рендерим событие с ошибкой
      render 'events/show', alert: I18n.t('controllers.photos.error')
    end
  end

  def destroy
    message = {notice: I18n.t('controllers.photos.destroyed')}

    # Проверяем, может ли пользователь удалить фотографию
    # Если может — удаляем
    if current_user_can_edit?(@photo)
      @photo.destroy
    else
      # Если нет — сообщаем ему
      message = {alert: I18n.t('controllers.photos.destroy_error')}
    end

    # В любом случае редиректим юзера на событие
    redirect_to @event, message
  end

  private

  # Так как фотография — вложенный ресурс, в params[:event_id] рельсы
  # автоматически положат id события, которому принадлежит фотография
  # Это событие будет лежать в переменной контроллера @event
  def set_event
    @event = Event.find(params[:event_id])
  end

  # Получаем фотографию из базы стандартным методом find
  def set_photo
    @photo = @event.photos.find(params[:id])
  end

  # При создании новой фотографии мы получаем массив параметров photo
  # c единственным полем photo
  def photo_params
    params.fetch(:photo, {}).permit(:photo)
  end
end
