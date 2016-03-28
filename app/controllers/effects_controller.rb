class EffectsController < ApplicationController
  load_and_authorize_resource
  before_action :find_application
  before_action :set_effect, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  respond_to :html, :json

  def show
  end

  def new
    @effect = Effect.new
  end

  def edit
  end

  def create
    @effect = @application.effects.create(effect_params)
    respond_with(@application, @effect)
  end

  def update
    @effect.update(effect_params.merge(version: @effect.version + 1))
    respond_with(@application, @effect)
  end

  def destroy
    @effect.destroy
    respond_with(@application, @effect, location: @application)
  end

  def small_icon
    redirect_to @effect.small_icon.url(:original, false)
  end

  def small_icon_2
    redirect_to @effect.small_icon_2.url(:original, false)
  end

  def large_icon
    redirect_to @effect.large_icon.url(:original, false)
  end

  def large_icon_2
    redirect_to @effect.large_icon_2.url(:original, false)
  end

  def assets_ios
    redirect_to @effect.assets_ios.url(:original, false)
  end

  def assets_android
    redirect_to @effect.assets_android.url(:original, false)
  end

  def page_for_printing
    redirect_to @effect.large_icon_2.url(:original, false)
  end

  private
    def find_application
      @application = Application.find(params[:application_id])
    end

    def set_effect
      @effect = @application.effects.find(params[:id])
    end

    def effect_params
      params.require(:effect).permit(
        :name_ru,
        :name_en,
        :description_ru,
        :description_en,
        :collection_id,
        :small_icon,
        :small_icon_2,
        :large_icon,
        :large_icon_2,
        :assets_ios,
        :assets_android,
        :page_for_printing
      )
    end
end
