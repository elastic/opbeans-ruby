class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.belongs_to :customer, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
