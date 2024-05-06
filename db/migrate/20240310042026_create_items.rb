class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      # 以下はチャレンジ機能選択時のみ定義してください
      t.integer :genre_id, null: false
      t.boolean :is_active, null: false, default: true

      # ここまで
      t.timestamps

    end
  end
end