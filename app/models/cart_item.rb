class CartItem < ApplicationRecord
  belongs_to :member
  belongs_to :item
  validates :member_id, :item_id, :piece, presence: true
  validates :piece, numericality: { only_integer: true }
end
