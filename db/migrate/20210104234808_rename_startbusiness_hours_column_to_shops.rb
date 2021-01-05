class RenameStartbusinessHoursColumnToShops < ActiveRecord::Migration[5.2]
  def change
    rename_column :shops, :startbusiness_hours, :start_business_hours
  end
end
