class CreateLineItems < ActiveRecord::Migration[8.0]
  def change
    create_table :line_items do |t|
      t.references :line_item_date, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.integer :quantity
      t.decimal :unit_price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
