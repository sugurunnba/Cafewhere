class RemoveIsAcriveFromGenres < ActiveRecord::Migration[5.2]
  def up
    remove_column :genres, :is_active
  end

  def down
    add_column :genres, :is_active, :boolean
  end
end
