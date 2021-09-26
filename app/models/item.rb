class Item < ApplicationRecord
  belongs_to :admins, optional: true
  has_many :cart_items, dependent: :destroy
  attachment :picture
  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: { only_integer: true }
  validates :picture, presence: true
end
