class RenameStartbusinessHoursColumnToShops < ActiveRecord::Migration[5.2]
  def change
    rename_column :shops, :start_business_hours, :start_business_hours
  end
end
