module Api
  module V1
    class EffectsController < Api::BaseController
      before_action :verify_token
      before_action :find_application
      before_action :set_collection

      def small_icon
        redirect_to @effect.small_icon.url(:original, false)
      end

      def small_icon_2
        redirect_to @effect.small_icon_2.url(:original, false)
      end

      def large_icon
        redirect_to @effect.large_icon.url(:original, false)
      end

      def large_icon_2
        redirect_to @effect.large_icon_2.url(:original, false)
      end

      def assets_ios
        @effect.update(ios_count_downloads: @effect.ios_count_downloads + 1)
        redirect_to @effect.assets_ios.url(:original, false)
      end

      def assets_android
        @effect.update(android_count_downloads: @effect.android_count_downloads + 1)
        redirect_to @effect.assets_android.url(:original, false)
      end

      def page_for_printing
        redirect_to @effect.page_for_printing.url(:original, false)
      end

      def tmp1
        redirect_to @effect.tmp1.url(:original, false)
      end

      def tmp2
        redirect_to @effect.tmp2.url(:original, false)
      end

      private

      def find_application
        @application = Application.find(params[:application_id])
      end

      def set_collection
        @effect = @application.effects.find(params[:id])
      end
    end
  end
end
