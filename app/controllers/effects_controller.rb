class EffectsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :edit, :create, :update, :destroy]
  load_and_authorize_resource
  skip_authorize_resource except: [:show, :new, :edit, :create, :update, :destroy]
  before_action :find_application
  before_action :set_effect, except: [:new, :create]

  respond_to :html, :json

  def show
  end

  def new
    @effect = @application.effects.new
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
    @effect.update(ios_count_downloads: @effect.ios_count_downloads + 1)
    redirect_to @effect.assets_ios.url(:original, false)
  end

  def assets_android
    @effect.update(android_count_downloads: @effect.android_count_downloads + 1)
    redirect_to @effect.assets_android.url(:original, false)
  end

  def page_for_printing
    redirect_to @effect.page_for_printing.url(:original, false)
  end

  def tmp1
    redirect_to @effect.tmp1.url(:original, false)
  end

  def tmp2
    redirect_to @effect.tmp2.url(:original, false)
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
        :page_for_printing,
        :tmp1,
        :tmp2,
        :hide
      )
    end
end
