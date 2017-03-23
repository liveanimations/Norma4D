module Api
  module V1
    class SendEmailController < Api::BaseController
      before_action :verify_token
      before_action :set_application
      before_action :set_auto_respond
      before_action :collect_email

      def create
        email = requred_params[:email]
        AutoRespondMailer.respond(email, content, @application).deliver_now if @auto_responder
        render nothing: true
      end

      private

      def requred_params
        params.permit(:email, :lang, :application_id, :coloring_id, :collection_id, :extended)
      end

      def set_auto_respond
        if @application.id == 5
          @auto_responder = if requred_params[:lang].in?(%w(RU UK BE KK))
                              AutoResponder.find(115)
                            else
                              AutoResponder.find(114)
                            end
        elsif @application.id == 12
          @auto_responder = if requred_params[:lang].in?(%w(RU UK BE KK))
                              AutoResponder.find(125)
                            else
                              AutoResponder.find(127)
                            end
        elsif @application.id == 2
          @auto_responder = if requred_params[:lang].in?(%w(RU UK BE KK))
                              AutoResponder.find(125)
                            else
                              AutoResponder.find(126)
                            end
        else
          @auto_responder = if requred_params[:lang].in?(%w(RU BE KK))
                              AutoResponder.find(116)
                            elsif requred_params[:lang].in?(%w(UK))
                              AutoResponder.find(124)
                            else
                              AutoResponder.find(123)
                            end
        end
      end
      
      def set_application
        @application = Application.find(requred_params[:application_id])
      end

      def content
        if @auto_responder.id.in?([116, 124, 123])
          @auto_responder.content.sub! 'COLORING_ID', requred_params[:coloring_id]
        elsif @auto_responder.id.in?([125, 126, 127])
          (@auto_responder.content.sub! 'COLLECTION_ID', requred_params[:collection_id]).sub! 'TYPE', zipfile_name
        else
          @auto_responder.content
        end
      end
      
      def zipfile_name
        requred_params[:extended] == '1' ? 'extended_pages_for_print' : 'pages_for_print'
      end

      def collect_email
        UserEmail.create(email: requred_params[:email]) unless find_email
      end

      def find_email
        UserEmail.find_by_email(requred_params[:email])
      end
    end
  end
end

