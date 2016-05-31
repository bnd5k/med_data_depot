require 'open-uri'
require 'nokogiri'

module MedDataDepot
  module WebScraper
    class Scraper

      def initialize(web_scraping_events_model)
        @web_scraping_events_model = web_scraping_events_model
      end

      def search_for_content(url, location)
        doc = Nokogiri::HTML(open(url))
        found_content = doc.search(location)

        if found_content
          found_content.to_html
        else
          web_scraping_events_model.create!(
            event_type: web_scraping_events_model::EVENT_TYPES[:failure],
            url: url,
            location: location
          )
          nil
        end
      end

      private

      attr_reader :web_scraping_events_model

    end
  end
end
