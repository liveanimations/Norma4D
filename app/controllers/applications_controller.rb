class ApplicationsController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :technical_works]
  load_and_authorize_resource except: :technical_works
  before_action :set_application, only: [:show, :edit, :update, :destroy, :technical_works]
  before_action :autoresponders, except: [:new, :edit]

  def index
    @applications = Application.all
  end

  def show
  end

  def new
    @application = Application.new
  end

  def edit
  end

  def create
    @application = Application.new(application_params)

    respond_to do |format|
      if @application.save
        format.html { redirect_to @application, notice: 'Application was successfully created.' }
        format.json { render :show, status: :created, location: @application }
      else
        format.html { render :new }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to applications_url, notice: 'Application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def technical_works
    render json: {status: @application.technical_works}
  end

  private

  def autoresponders
    @autoresponders = AutoResponder.all
  end

  def set_application
    @application = Application.find(params[:id])
  end

  def application_params
    params.require(:application).permit(:name, :auto_responder_id, :certificate, :android_api_key, :technical_works)
  end
end
