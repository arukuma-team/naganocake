class Item < ApplicationRecord
  belongs_to :admins, optional: true
  has_many :order_items, dependent: :destroy
  attachment :picture
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :picture, presence: true
end
