class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title,          null: false
      t.text :text,             null: false
      t.integer :category_id,   null: false
      t.integer :state_id,      null: false
      t.integer :burden_id,     null: false
      t.integer :prefecture_id, null: false
      t.integer :day_id,        null: false
      t.integer :charge,        null: false
      t.timestamps
    end
  end
end
