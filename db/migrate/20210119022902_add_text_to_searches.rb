class AddTextToSearches < ActiveRecord::Migration[5.2]
  def change
    add_column :searches, :text, :string
  end
end
