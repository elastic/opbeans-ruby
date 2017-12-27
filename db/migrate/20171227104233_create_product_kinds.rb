class CreateProductKinds < ActiveRecord::Migration[5.1]
  def change
    create_table :product_kinds do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :product_kinds, :name, {unique: true}
  end
end
