class GeneratePagesForPrinting < ActiveJob::Base
  queue_as :default

  def perform(app_id, collection_id)
    PageForPrintingArchive.new(app_id, collection_id).perform
  end
end
