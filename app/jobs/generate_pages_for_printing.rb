class GeneratePagesForPrinting < ActiveJob::Base
  queue_as :default

  def perform(app_id, collection_id, extended = false)
    PageForPrintingArchive.new(app_id, collection_id, extended).perform
  end
end
