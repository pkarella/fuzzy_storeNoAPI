class User < ApplicationRecord
  has_one :account
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 after_create :register_account
   def register_account
     @user = User.last
     @account = Account.create!(user_id: @user.id)
   end

   def bought
     @purchased = []
     if self.account.orders.any?
       self.account.orders.each do |order|
         order.order_items.each do |item|
           @purchased.push(item.product)
         end
       end
     end
     @purchased
   end
end
