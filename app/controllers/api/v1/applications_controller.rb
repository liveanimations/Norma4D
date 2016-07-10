module Api
  module V1
    class ApplicationsController < Api::BaseController
      before_action :set_application
      before_action :verify_token

      def show
        render json: @application
      end
    end
  end
end
