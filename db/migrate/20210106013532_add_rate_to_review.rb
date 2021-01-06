class AddRateToReview < ActiveRecord::Migration[5.2]
  def change
    # 理解できていません
    add_column :reviews, :rate, :float, null: false, default: 0
  end
end
