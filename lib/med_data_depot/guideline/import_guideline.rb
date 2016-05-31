module MedDataDepot
  module Guideline
    class ImportGuideline

      GUIDELINE_TITLE_LOCATION = '.content_title'
      RECOMMENDATION_LOCATION = '#ctl00_ContentPlaceHolder1_dlXML_ctl03_rptField_ctl00_divOuter'
      #^ we antipate the location changing eventually. Wrapping it in constant allows us to
      #set & update location without worrying about breaking tests

      def initialize(guideline_model, scraper)
        @guideline_model = guideline_model
        @scraper = scraper
      end

      def call(guideline_id)
        guideline = guideline_model.find_by_id(guideline_id)
        if guideline
          title, recommendation = scraper.search_for_title_and_content(
            guideline.url,
            GUIDELINE_TITLE_LOCATION,
            RECOMMENDATION_LOCATION)

          guideline.update!(title: title, recommendation: recommendation)

        end

      end

      private

      attr_reader :guideline_model, :scraper

    end
  end
end
