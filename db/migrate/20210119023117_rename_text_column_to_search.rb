class RenameTextColumnToSearch < ActiveRecord::Migration[5.2]
  def change
    rename_column :searches, :text, :search
  end
end
