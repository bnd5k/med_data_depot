require 'med_data_depot/web_scraper/mock_scraper'
require 'med_data_depot/web_scraper/scraper'

module MedDataDepot
  module WebScraper
    module Factory

      def self.scraper
        MedDataDepot::WebScraper::Scraper.new(::WebScrapingEvent)
      end

      def self.mock_scraper
        MedDataDepot::WebScraper::MockScraper.new
      end

    end
  end
end

