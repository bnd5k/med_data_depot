require 'open-uri'
require 'nokogiri'

module MedDataDepot
  module WebScraper
    class Scraper

      def initialize(web_scraping_events_model)
        @web_scraping_events_model = web_scraping_events_model
      end

      def search_for_title_and_content(url, title_location, content_location)
        url_to_scrape = open(url)
        document = Nokogiri::HTML(url_to_scrape)

        title = find_title(url, title_location, document)
        content = find_content(url, content_location, document)

        return title, content
      end

      private

      attr_reader :web_scraping_events_model

      def document_from_url(url)
        url_to_scrape = open(url)
        document = Nokogiri::HTML(url_to_scrape)
      end

      def find_title(url, title_location, document)
        found_title = document.search(title_location).children.first

        if found_title
          found_title.text
        else
          web_scraping_events_model.create!(
            event_type: web_scraping_events_model::EVENT_TYPES[:failure],
            url: url,
            location: title_location
          )
          nil
        end
      end

      def find_content(url, location, document)
        found_content = document.search(location)

        if !found_content.empty?
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

    end
  end
end
