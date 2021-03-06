require 'med_data_depot/web_scraper/mock_scraper'
require 'med_data_depot/web_scraper/scraper'
require './app/models/web_scraping_event'

module MedDataDepot
  module WebScraper
    module Factory
      class << self

        def scraper
          MedDataDepot::WebScraper::Scraper.new(::WebScrapingEvent)
        end

        def mock_scraper
          MedDataDepot::WebScraper::MockScraper.new
        end

      end
    end
  end
end
