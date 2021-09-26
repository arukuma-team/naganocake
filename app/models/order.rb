class Order < ApplicationRecord
  belongs_to :member
  has_many :ordered_items, dependent: :destroy
  
  validates :addresses, presence: true
  
end
