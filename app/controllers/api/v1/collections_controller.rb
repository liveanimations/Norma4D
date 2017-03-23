module Api
  module V1
    class CollectionsController < Api::BaseController
      before_action :verify_token
      before_action :find_application
      before_action :set_collection

      def small_icon
        response.headers['Content-Length'] = @collection.small_icon.size.to_s
        send_file @collection.small_icon.path
      end

      def small_icon_2
        response.headers['Content-Length'] = @collection.small_icon_2.size.to_s
        send_file @collection.small_icon_2.path
      end

      def medium_icon
        response.headers['Content-Length'] = @collection.medium_icon.size.to_s
        send_file @collection.medium_icon.path
      end

      def medium_icon_2
        response.headers['Content-Length'] = @collection.medium_icon_2.size.to_s
        send_file @collection.medium_icon_2.path
      end

      def large_icon
        response.headers['Content-Length'] = @collection.large_icon.size.to_s
        send_file @collection.large_icon.path
      end

      def large_icon_2
        response.headers['Content-Length'] = @collection.large_icon_2.size.to_s
        send_file @collection.large_icon_2.path
      end

      def dat
        response.headers['Content-Length'] = @collection.dat.size.to_s
        send_file @collection.dat.path
      end

      def xml
        response.headers['Content-Length'] = @collection.xml.to_s
        send_file @collection.xml.path
      end

      private

      def find_application
        @application = Application.find(params[:application_id])
      end

      def set_collection
        @collection = @application.collections.find(params[:id])
      end
    end
  end
end
