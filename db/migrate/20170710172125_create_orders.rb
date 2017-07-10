class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.column :status, :string
      t.column :total_price, :decimal
      t.column :shipping, :decimal
    

      t.timestamps
    end
  end
end
