class CommercialsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :edit, :create, :update, :destroy]
  load_and_authorize_resource
  skip_authorize_resource except: [:show, :new, :edit, :create, :update, :destroy]
  before_action :find_application
  before_action :set_commercial, except: [:new, :create]

  respond_to :html, :json

  def show
  end

  def new
    @commercial = @application.commercials.new
  end

  def edit
  end

 def create
    @commercial = @application.commercials.create(commercial_params)
    respond_with(@application, @commercial)
  end

  def update
    @commercial.update(commercial_params)
    respond_with(@application, @commercial)
  end

  def destroy
    @commercial.destroy
    respond_with(@application, @commercial, location: @application)
  end

  def image1
    redirect_to @commercial.image1.url(:original, false)
  end

  def image2
    redirect_to @commercial.image2.url(:original, false)
  end

  private

    def set_commercial
      @commercial = @application.commercials.find(params[:id])
    end

    def find_application
      @application = Application.find(params[:application_id])
    end

    def commercial_params
      params.require(:commercial).permit(
        :name,
        :collection_id,
        :image1,
        :image2,
        :title,
        :description,
        :price,
        :url
      )
    end
end
