require 'med_data_depot/guideline/import_guideline'

module MedDataDepot
  module Guideline
    class << self

      def import_guideline
        ImportGuideline.new(
          ::Guideline,
          MedDataDepot::Scraper
        )
      end

    end
  end
end
