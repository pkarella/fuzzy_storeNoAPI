class Accounts < ActiveRecord::Migration[5.1]
  def change
      create_table :accounts do |t|
        t.column :order_id, :integer
        t.belongs_to :user, index: true
  end
end
end
