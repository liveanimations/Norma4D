module IndiaRedirectable
  extend ActiveSupport::Concern

  module ClassMethods

    private
    def india_redirectable(path_regexp)
      before_action do
        if Rails.env.production?
          remote_ip = request.remote_ip
          if remote_ip == '115.124.99.87'
            logger.info 'India server client connection'
          else
            if request.path.match(path_regexp)
              geo = MaxmindDB.lookup(remote_ip)
              if geo.found? && geo.country.name.in?(%w(India))
                logger.info "This client (IP: #{remote_ip}, country: #{geo.country.name}) is redirected to India VPS"
                redirect_to "#{Rails.application.secrets.india_server_url}#{request.path}"
              end
            end
          end
        end
      end
    end
  end

end
