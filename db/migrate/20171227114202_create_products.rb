class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :sku, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.belongs_to :product_kind, foreign_key: true, null: false
      t.bigint :stock, null: false
      t.bigint :cost, null: false
      t.bigint :selling_price, null: false

      t.timestamps
    end

    add_index :products, :sku, {unique: true}
  end
end
