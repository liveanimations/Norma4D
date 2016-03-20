class EffectsController < ApplicationController
  before_action :find_application
  before_action :set_effect, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  respond_to :html, :json

  def show
  end

  def new
    @effect = Effect.new
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

  private
    def find_application
      @application = Application.find(params[:application_id])
    end

    def set_effect
      @effect = @application.effects.find(params[:id])
    end

    def effect_params
      params.require(:effect).permit(:name_ru, :name_en, :description_ru, :description_en)
    end
end
