module CacheInvalidatable
  extend ActiveSupport::Concern

  module ClassMethods
    attr_reader :jpeg_attachments, :other_attachments

    def cache_invalidatable(jpeg_attachments:, other_attachments:)
      @jpeg_attachments = jpeg_attachments
      @other_attachments = other_attachments
      after_update :invalidate_cache
    end
  end

  def invalidate_cache
    return true unless Rails.application.secrets.india_server_url
    resource_name = self.class.name.downcase
    self.class.jpeg_attachments.each do |attachment|
      trigger_cache_update(attachment, resource_name, :jpg)
    end
    self.class.other_attachments.each do |attachment|
      trigger_cache_update(attachment, resource_name)
    end
    true # because this is an ActiveRecord callback
  end

  private
  def trigger_cache_update(attachment, resource, extension = nil )
    if self.send("#{attachment}_updated_at_changed?")
      method_name = "#{attachment}_application_#{resource}_path" # eg small_icon_application_effect_path
      url = Rails.application.routes.url_helpers.send(method_name, application.id, id, extension)
      InvalidateCacheJob.perform_later(url)
    end
  end

end
