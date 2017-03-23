module Api
  module V1
    class EffectsController < Api::BaseController
      before_action :verify_token
      before_action :find_application
      before_action :set_effect

      def small_icon
        response.headers['Content-Length'] = @effect.small_icon.size.to_s
        redirect_to @effect.small_icon.url(:original, false)
      end

      def small_icon_2
        response.headers['Content-Length'] = @effect.small_icon_2.size.to_s
        redirect_to @effect.small_icon_2.url(:original, false)
      end

      def large_icon
        response.headers['Content-Length'] = @effect.large_icon.size.to_s
        redirect_to @effect.large_icon.url(:original, false)
      end

      def large_icon_2
        response.headers['Content-Length'] = @effect.large_icon_2.size.to_s
        redirect_to @effect.large_icon_2.url(:original, false)
      end

      def assets_ios
        @effect.update(ios_count_downloads: @effect.ios_count_downloads + 1)
        response.headers['Content-Length'] = @effect.assets_ios.size.to_s
        redirect_to @effect.assets_ios.url(:original, false)
      end

      def assets_android
        response.headers['Content-Length'] = @effect.assets_android.size.to_s
        @effect.update(android_count_downloads: @effect.android_count_downloads + 1)
        redirect_to @effect.assets_android.url(:original, false)
      end

      def page_for_printing
        response.headers['Content-Length'] = @effect.page_for_printing.size.to_s
        redirect_to @effect.page_for_printing.url(:original, false)
      end

      def dat
        response.headers['Content-Length'] = @effect.dat.size.to_s
        redirect_to @effect.dat.url(:original, false)
      end

      def xml
        response.headers['Content-Length'] = @effect.xml.size.to_s
        redirect_to @effect.xml.url(:original, false)
      end

      private

      def find_application
        @application = Application.find(params[:application_id])
      end

      def set_effect
        @effect = @application.effects.find(params[:id])
      end
    end
  end
end
