require 'zip'

class PageForPrintingArchive
  def initialize(app_id, collection_id)
    @app_id = app_id
    @collection_id = collection_id
  end

  def perform
    ZipFileGenerator.new(input_filenames, zipfile).write
  end

  private

  def application
    @_application ||= Application.find(@app_id)
  end

  def collection
    @_collection ||= application.collections.find(@collection_id)
  end

  def zipfile
    "#{Rails.root}/public/files/collections/#{@collection_id}/pages_for_printing.zip"
  end

  def input_filenames
    collection.effects.where.not(page_for_printing_file_name: nil).map do |effect|
      effect.page_for_printing.path
    end
  end
end
