class NotificationsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  before_action :set_notification, only: [:show, :edit, :update, :destroy, :push]

  def index
    @notifications = Notification.all
  end

  def show
  end

  def new
    @notification = Notification.new
  end

  def edit
  end

  def create
    @notification = Notification.new(notification_params)

    respond_to do |format|
      if @notification.save
        format.html { redirect_to @notification, notice: 'Notification was successfully created.' }
        format.json { render :show, status: :created, location: @notification }
      else
        format.html { render :new }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to @notification, notice: 'Notification was successfully updated.' }
        format.json { render :show, status: :ok, location: @notification }
      else
        format.html { render :edit }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url, notice: 'Notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def push
    NotifyIosJob.perform_now(@notification.application_id, @notification.text)
    # NotifyAndroidJob.perform_now(@notification.application_id, @notification.text)
    redirect_to @notification, notice: 'Notification was push.'
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end

  def notification_params
    params.require(:notification).permit(:name, :text, :application_id)
  end
end
