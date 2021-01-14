class ChangeDatatypeFinishBusinessHoursOfShops < ActiveRecord::Migration[5.2]
  def change
    change_column :shops, :finish_business_hours, :time
  end
end
