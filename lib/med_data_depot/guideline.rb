require 'med_data_depot/guideline/import_guideline_recommendation'

module MedDataDepot
  module Guideline
    class << self

      def import_guideline_recommendation
        ImportGuidelineRecommendation.new(
          ::Guideline,
          MedDataDepot::Scraper
        )
      end

    end
  end
end
