require 'open-uri'
require 'nokogiri'

module MedDataDepot
  module WebScraper
    class Scraper

      def initialize(web_scraping_events_model)
        @web_scraping_events_model = web_scraping_events_model
      end

      def search_for_title_and_content(url, title_location, content_location)
        begin
          url_to_scrape = open(url)
          document = Nokogiri::HTML(url_to_scrape)

          title = find_title(url, title_location, document)
          content = find_content(url, content_location, document)

          return title, content

        rescue Errno::EHOSTUNREACH => e
          document_scraping_issue( web_scraping_events_model::EVENT_TYPES[:no_connection], url)
          return nil
        rescue ::Net::OpenTimeout => e
          document_scraping_issue( web_scraping_events_model::EVENT_TYPES[:timeout], url)
          return nil
        end
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
          document_scraping_issue( web_scraping_events_model::EVENT_TYPES[:not_found], url, title_location)
          nil
        end
      end

      def find_content(url, location, document)
        found_content = document.search(location)

        if !found_content.empty?
          raw_content = found_content.to_html
          stripped_content = raw_content.gsub(/>\s+</, "><")
        else
          document_scraping_issue( web_scraping_events_model::EVENT_TYPES[:not_found], url, location)
          nil
        end
      end

      def document_scraping_issue(event_type, url, location=nil)
        web_scraping_events_model.create!(
          event_type: event_type,
          url: url,
          location: location
        )
      end

    end
  end
end
