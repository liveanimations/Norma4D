module Api
  module V1
    class ErrorsController < Api::BaseController
      before_action :verify_token

      def create
        @error = Error.create(error_params)
        render text: 'OK'
      end

      private

      def error_params
        params.require(:error).permit(:message, :stack_trace, :error_type)
      end
    end
  end
end
