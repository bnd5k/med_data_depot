class RenameRecommendationsTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :recommendations, :guidelines
  end
end
