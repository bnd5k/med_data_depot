class AlterGuidelinesTableRenameTextCol < ActiveRecord::Migration[5.0]
  def change
    rename_column :guidelines, :text, :recommendation
  end
end
