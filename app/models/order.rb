class Order < ApplicationRecord
  belongs_to :member
  has_many :order_items, dependent: :destroy
  
  validates :addresses, presence: true
  
end
