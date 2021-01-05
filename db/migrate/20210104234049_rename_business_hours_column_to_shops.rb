class RenameBusinessHoursColumnToShops < ActiveRecord::Migration[5.2]
  def change
    rename_column :shops, :business_hours, :start_business_hours
  end
end
