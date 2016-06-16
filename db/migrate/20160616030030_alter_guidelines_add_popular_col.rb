class AlterGuidelinesAddPopularCol < ActiveRecord::Migration[5.0]
  def change
    add_column :guidelines, :popular, :boolean
  end
end
