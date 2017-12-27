class CreateOrderLines < ActiveRecord::Migration[5.1]
  def change
    create_table :order_lines do |t|
      t.belongs_to :order, foreign_key: true, index: true, null: false
      t.belongs_to :product, foreign_key: true, index: true, null: false
      t.bigint :amount, null: false

      t.timestamps
    end
  end
end
