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
      # NotifyIosJob.perform_later(@application.id, 'New collection was added')
      # NotifyAndroidJob.perform_later(@application.id, 'New collection was added')
    end
    respond_with(@application, @collection)
  end

  def update
    @collection.update(collection_params.merge(version: @collection.version + 1))
    if @collection.printable
      # NotifyIosJob.perform_later(@application.id, @collection)
      # NotifyAndroidJob.perform_later(@application.id, @collection)
    end
    respond_with(@application, @collection)
  end

  def destroy
    @collection.destroy
    respond_with(@application, @collection, location: @application)
  end

  def small_icon
    send_file @collection.small_icon.path
  end

  def small_icon_2
    send_file @collection.small_icon_2.path
  end

  def medium_icon
    send_file @collection.medium_icon.path
  end

  def medium_icon_2
    send_file @collection.medium_icon_2.path
  end

  def large_icon
    send_file @collection.large_icon.path
  end

  def large_icon_2
    send_file @collection.large_icon_2.path
  end

  def dat
    send_file @collection.dat.path
  end

  def xml
    send_file @collection.xml.path
  end

  def pages_for_print
    send_file "public/files/collections/#{@collection.id}/pages_for_printing.zip"
  end

  def extended_pages_for_print
    send_file "public/files/collections/#{@collection.id}/extended_pages_for_printing.zip"
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
      :dat,
      :xml,
      :hide,
      :sort_index,
      :collection_id,
      :unhide_app_version
    )
  end
end
