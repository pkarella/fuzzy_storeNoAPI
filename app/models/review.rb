class Review < ApplicationRecord
  belongs_to :product
  has_many :photos, :as => :photoable
end
