class CollectionsController < ApplicationController
  before_filter :authenticate_user!, only: [:show, :new, :edit, :create, :update, :destroy]
  load_and_authorize_resource
  skip_authorize_resource except: [:show, :new, :edit, :create, :update, :destroy]
  before_action :find_application
  before_action :set_collection, except: [:new, :create]

  respond_to :html, :json

  def show
  end

  def new
    @collection = @application.collections.new
  end

  def edit
  end

  def create
    @collection = @application.collections.create(collection_params)
    if @collection.printable
      Device.notify(@application.id, 'New collection was added')
    end
    respond_with(@application, @collection)
  end

  def update
    @collection.update(collection_params.merge(version: @collection.version + 1))
    Device.notify(@application.id, "#{@collection.name_ru} was updated") if @collection.printable
    respond_with(@application, @collection)
  end

  def destroy
    @collection.destroy
    respond_with(@application, @collection, location: @application)
  end

  def small_icon
    redirect_to @collection.small_icon.url(:original, false)
  end

  def small_icon_2
    redirect_to @collection.small_icon_2.url(:original, false)
  end

  def medium_icon
    redirect_to @collection.medium_icon.url(:original, false)
  end

  def medium_icon_2
    redirect_to @collection.medium_icon_2.url(:original, false)
  end

  def large_icon
    redirect_to @collection.large_icon.url(:original, false)
  end

  def large_icon_2
    redirect_to @collection.large_icon_2.url(:original, false)
  end

  private
    def find_application
      @application = Application.find(params[:application_id])
    end

    def set_collection
      @collection = @application.collections.find(params[:id])
    end

    def collection_params
      params.require(:collection).permit(
        :price,
        :name_ru,
        :name_en,
        :description_ru,
        :description_en,
        :small_icon,
        :small_icon_2,
        :medium_icon,
        :medium_icon_2,
        :large_icon,
        :large_icon_2,
        :printable,
        :product,
        :app_version,
        :hide
      )
    end
end
