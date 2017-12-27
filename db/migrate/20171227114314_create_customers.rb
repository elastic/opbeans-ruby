class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :full_name, null: false
      t.string :company_name, null: false
      t.string :email, null: false
      t.string :address, null: false
      t.string :postal_code, null: false
      t.string :city, null: false
      t.string :country, null: false

      t.timestamps
    end
  end
end
