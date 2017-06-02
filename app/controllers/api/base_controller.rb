module Api
  class BaseController < ActionController::Base
    before_action :redirect_to_india_server

    private

    def set_application
      @application = Application.find(params[:id])
    end

    def verify_token
      unless Rails.application.secrets.api_token == params[:api_token]
        render nothing: true, status: :unauthorized
      end
    end

    def redirect_to_india_server
      if Rails.env.production?
        logger.info "This CLIENT from #{request.location.try(:country)}"
        if request.location.try(:country).in?(['India', 'Thailand'])
          logger.info "This CLIENT redirected"
          if request.path.match(/\/api\/v1\/applications/)
            redirect_to "http://india-api.liveanimations.org#{request.path}"
          end
        end
      end
    end
  end
end
