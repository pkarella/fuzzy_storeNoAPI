class Message < ApplicationRecord
  has_many :photos, :as => :photoable
  belongs_to :account

end
