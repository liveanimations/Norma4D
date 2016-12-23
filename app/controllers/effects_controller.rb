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
    generate_pages_for_printing
    respond_with(@application, @effect)
  end

  def update
    @effect.update(effect_params.merge(version: @effect.version + 1))
    generate_pages_for_printing
    respond_with(@application, @effect)
  end

  def destroy
    @effect.destroy
    respond_with(@application, @effect, location: @application)
  end

  def small_icon
    send_file @effect.small_icon.path
  end

  def small_icon_2
    send_file @effect.small_icon_2.path
  end

  def large_icon
    send_file @effect.large_icon.path
  end

  def large_icon_2
    send_file @effect.large_icon_2.path
  end

  def assets_ios
    @effect.update(ios_count_downloads: @effect.ios_count_downloads + 1)
    send_file @effect.assets_ios.path
  end

  def assets_android
    @effect.update(android_count_downloads: @effect.android_count_downloads + 1)
    send_file @effect.assets_android.path
  end

  def page_for_printing
    send_file @effect.page_for_printing.path
  end

  def dat
    send_file @effect.dat.path
  end

  def xml
    send_file @effect.xml.path
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
        :dat,
        :xml,
        :hide,
        :parent,
        :extended
      )
    end

    def generate_pages_for_printing
      if effect_params[:page_for_printing] || effect_params[:collection_id] || effect_params[:extended]
        GeneratePagesForPrinting.perform_later(
          @application.id, @effect.collection_id, @effect.extended
        )
        GeneratePagesForPrinting.perform_later(
          @application.id, @effect.collection_id, !@effect.extended
        )
      end
    end
end
