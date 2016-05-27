class CreateRecommendations < ActiveRecord::Migration[5.0]
  def change
    create_table :recommendations do |t|
      t.string :title
      t.text :text
      t.string :url

      t.timestamps
    end
  end
end
