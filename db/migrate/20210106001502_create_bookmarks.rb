class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      # references, integer型でbelongs_toを設定してくれる。外部キーのみ設定するテーブルには便利。
      t.references :user, foreign_key: true, null: false
      t.references :shop, foreign_key: true, null: false

      t.timestamps
    end
  end
end
