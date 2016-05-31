require 'med_data_depot/guideline/import_guideline'

module MedDataDepot
  module Guideline
    class << self

      def list
        List.new(
          ::Guideline
        )
      end

      def find
        FindGuideline.new(
          ::Guideline
        )
      end

      def import_guideline
        ImportGuideline.new(
          ::Guideline,
          MedDataDepot::Scraper
        )
      end

    end
  end
end
