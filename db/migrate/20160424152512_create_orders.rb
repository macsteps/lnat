class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :subtotal, precision: 8, scale: 2
      t.decimal :tax, precision: 8, scale: 2
      t.decimal :shipping, precision: 8, scale: 2
      t.decimal :total, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
