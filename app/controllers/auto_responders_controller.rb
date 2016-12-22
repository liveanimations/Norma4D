class AutoRespondersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_auto_responder, only: [:show, :edit, :update, :destroy]

  # GET /auto_responders
  # GET /auto_responders.json
  def index
    @auto_responders = AutoResponder.all
  end

  # GET /auto_responders/1
  # GET /auto_responders/1.json
  def show
  end

  # GET /auto_responders/new
  def new
    @auto_responder = AutoResponder.new
  end

  # GET /auto_responders/1/edit
  def edit
  end

  # POST /auto_responders
  # POST /auto_responders.json
  def create
    @auto_responder = AutoResponder.new(auto_responder_params)

    respond_to do |format|
      if @auto_responder.save
        format.html { redirect_to @auto_responder, notice: 'Auto responder was successfully created.' }
        format.json { render :show, status: :created, location: @auto_responder }
      else
        format.html { render :new }
        format.json { render json: @auto_responder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auto_responders/1
  # PATCH/PUT /auto_responders/1.json
  def update
    respond_to do |format|
      if @auto_responder.update(auto_responder_params)
        format.html { redirect_to @auto_responder, notice: 'Auto responder was successfully updated.' }
        format.json { render :show, status: :ok, location: @auto_responder }
      else
        format.html { render :edit }
        format.json { render json: @auto_responder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auto_responders/1
  # DELETE /auto_responders/1.json
  def destroy
    @auto_responder.destroy
    respond_to do |format|
      format.html { redirect_to auto_responders_url, notice: 'Auto responder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auto_responder
      @auto_responder = AutoResponder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auto_responder_params
      params.require(:auto_responder).permit(:name, :content)
    end
end
