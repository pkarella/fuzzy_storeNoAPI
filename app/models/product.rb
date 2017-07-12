class Product < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :photos, :as => :photoable
  has_many :reviews
end
