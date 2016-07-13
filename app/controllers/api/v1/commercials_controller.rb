module Api
  module V1
    class CommercialsController < Api::BaseController
      before_action :verify_token
      before_action :find_application
      before_action :set_commercial

      def image1
        redirect_to @commercial.image1.url(:original, false)
      end

      def image2
        redirect_to @commercial.image2.url(:original, false)
      end

      private

      def find_application
        @application = Application.find(params[:application_id])
      end

      def set_commercial
        @commercial = @application.commercials.find(params[:id])
      end
    end
  end
end
