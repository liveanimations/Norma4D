module Api
  module V1
    class CollectionsController < Api::BaseController
      before_action :verify_token
      before_action :find_application
      before_action :set_collection

      def small_icon
        redirect_to @collection.small_icon.url(:original, false)
      end

      def small_icon_2
        redirect_to @collection.small_icon_2.url(:original, false)
      end

      def medium_icon
        redirect_to @collection.medium_icon.url(:original, false)
      end

      def medium_icon_2
        redirect_to @collection.medium_icon_2.url(:original, false)
      end

      def large_icon
        redirect_to @collection.large_icon.url(:original, false)
      end

      def large_icon_2
        redirect_to @collection.large_icon_2.url(:original, false)
      end

      def dat
        redirect_to @collection.dat.url(:original, false)
      end

      def xml
        redirect_to @collection.xml.url(:original, false)
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
