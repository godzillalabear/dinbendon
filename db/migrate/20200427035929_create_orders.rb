class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :order_num
      t.string :receiver
      t.string :phone
      t.string :address
      t.string :status
      t.text :note

      t.timestamps
    end
  end
end
