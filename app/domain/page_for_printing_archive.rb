require 'zip'

class PageForPrintingArchive
  def initialize(app_id, collection_id, extended = false)
    @app_id = app_id
    @collection_id = collection_id
    @extended = extended
  end

  def perform
    FileUtils.rm_rf(zipfile)
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
    "#{Rails.root}/public/files/collections/#{@collection_id}/#{zipfile_name}.zip"
  end

  def zipfile_name
    @extended ? 'extended_pages_for_printing' : 'pages_for_printing'
  end

  def input_filenames
    effects.map do |effect|
      effect.page_for_printing.path
    end
  end

  def effects
    if @extended
      collection.effects.where.not(page_for_printing_file_name: nil)
    else
      collection.effects.where.not(page_for_printing_file_name: nil).where(extended: false)
    end
  end
end
