class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.column :content, :string
      t.column :user_email, :string

      t.timestamps
    end
  end
end
