class ErrorsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :index]
  before_filter :authenticate_user!, except: [:create, :index]
  load_and_authorize_resource except: [:create, :index]
  before_action :set_error, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  # GET /errors
  # GET /errors.json
  def index
    # @error = Error.create(error_params)
    render nothing: true
  end

  def all_errors
    # @errors = Error.all
  end

  # GET /errors/1
  # GET /errors/1.json
  def show
  end

  # POST /errors
  # POST /errors.json
  def create
    # @error = Error.create(error_params)
    render nothing: true
  end

  # PATCH/PUT /errors/1
  # PATCH/PUT /errors/1.json
  def update
    respond_to do |format|
      if @error.update(error_params)
        format.html { redirect_to @error, notice: 'Error was successfully updated.' }
        format.json { render :show, status: :ok, location: @error }
      else
        format.html { render :edit }
        format.json { render json: @error.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /errors/1
  # DELETE /errors/1.json
  def destroy
    @error.destroy
    respond_to do |format|
      format.html { redirect_to errors_url, notice: 'Error was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_error
      @error = Error.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def error_params
      params.require(:error).permit(:message, :stack_trace, :error_type)
    end
end
