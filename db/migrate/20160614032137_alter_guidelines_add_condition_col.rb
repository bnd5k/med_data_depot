class AlterGuidelinesAddConditionCol < ActiveRecord::Migration[5.0]
  def change
    add_column :guidelines, :condition, :string
  end
end
