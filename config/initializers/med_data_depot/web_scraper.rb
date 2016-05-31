require 'med_data_depot/web_scraper/scraper_factory'

Rails.configuration.after_initialize do
  if ENV["RAILS_ENV"] == 'test'
    MedDataDepot::Scraper = MedDataDepot::WebScraper::Factory.mock_scraper
  else
    MedDataDepot::Scraper = MedDataDepot::WebScraper::Factory.scraper
  end

end
