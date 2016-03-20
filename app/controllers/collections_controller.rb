class CollectionsController < ApplicationController
  before_action :find_application
  before_action :set_collection, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  respond_to :html, :json

  def show
  end

  def new
    @collection = Collection.new
  end

  def edit
  end

  def create
    @collection = @application.collections.create(collection_params)
    respond_with(@application, @collection)
  end

  def update
    @collection.update(collection_params.merge(version: @collection.version + 1))
    respond_with(@application, @collection)
  end

  def destroy
    @collection.destroy
    respond_with(@application, @collection, location: @application)
  end

  private
    def find_application
      @application = Application.find(params[:application_id])
    end

    def set_collection
      @collection = @application.collections.find(params[:id])
    end

    def collection_params
      params.require(:collection).permit(:price, :name_ru, :name_en, :description_ru, :description_en)
    end
end
