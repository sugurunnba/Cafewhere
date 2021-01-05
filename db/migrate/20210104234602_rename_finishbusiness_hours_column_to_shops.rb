class RenameFinishbusinessHoursColumnToShops < ActiveRecord::Migration[5.2]
  def change
    rename_column :shops, :finish_business_hours, :finish_business_hours
  end
end
