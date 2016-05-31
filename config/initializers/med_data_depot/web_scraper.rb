require 'med_data_depot/web_scraper/mock_scraper'
require 'med_data_depot/web_scraper/scraper'

if ENV["RAILS_ENV"] == 'test'
  MedDataDepot::Scraper = MedDataDepot::WebScraper::MockScraper.new
else
  MedDataDepot::Scraper = MedDataDepot::WebScraper::Scraper.new(WebScrapingEvent)
end

