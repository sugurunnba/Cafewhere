class AddFinishBusinessHoursToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :finish_business_hours, :string
  end
end
