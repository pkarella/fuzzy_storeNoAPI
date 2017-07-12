class Accounts < ActiveRecord::Migration[5.1]
  def change
      create_table :accounts do |t|
        t.column :order_id, :integer
        t.belongs_to :user, index: true
  end
  User.create! do |u|
      u.email     = 'test@test.com'
      u.password    = 'password'
      u.admin    = true
  end
end
end
