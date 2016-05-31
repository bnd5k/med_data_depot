class CreateWebSrapingEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :web_sraping_events do |t|
      t.integer :event_type
      t.string :url
      t.string :location

      t.timestamps
    end
  end
end
