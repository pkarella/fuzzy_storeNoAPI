class Order < ApplicationRecord
  has_many :order_items
  belongs_to :account

  has_many :products, through: :order_items

  before_save :update_total
  before_create :update_status

scope :in_progress, -> (user) {where(:account_id => user.account.id, :status => 'In progress')}

  def calculate_total
    self.order_items.collect { |item| item.product.price.to_s.to_d * item.quantity.to_s.to_d }.sum
  end

  private

  def update_status
    if self.status == nil
      self.status = "In progress"
    end
  end

  def update_total
    self.total_price = calculate_total
  end

end
