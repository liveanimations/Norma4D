class FacebookImagesController < ApplicationController
  before_action :set_facebook_image, only: [:show, :edit, :update, :destroy]

  def index
    @facebook_images = FacebookImage.all
  end

  def show
  end

  def new
    @facebook_image = FacebookImage.new
  end

  def edit
  end

  def create
    @facebook_image = FacebookImage.new(facebook_image_params)

    respond_to do |format|
      if @facebook_image.save
        format.html { redirect_to @facebook_image, notice: 'Facebook image was successfully created.' }
        format.json { render :show, status: :created, location: @facebook_image }
      else
        format.html { render :new }
        format.json { render json: @facebook_image.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @facebook_image.update(facebook_image_params)
        format.html { redirect_to @facebook_image, notice: 'Facebook image was successfully updated.' }
        format.json { render :show, status: :ok, location: @facebook_image }
      else
        format.html { render :edit }
        format.json { render json: @facebook_image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @facebook_image.destroy
    respond_to do |format|
      format.html { redirect_to facebook_images_url, notice: 'Facebook image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facebook_image
      @facebook_image = FacebookImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facebook_image_params
      params.require(:facebook_image).permit(:name, :image)
    end
end
