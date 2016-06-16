class AlterGuidelinesSetDefaultPopularValue < ActiveRecord::Migration[5.0]
  def change
    change_column_default :guidelines, :popular, :false
  end
end
