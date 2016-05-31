class RenameWebScrapingEventTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :web_sraping_events, :web_scraping_events
  end
end
