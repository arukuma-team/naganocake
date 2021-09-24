class Item < ApplicationRecord
  belongs_to :admins, optional: true
  attachment :picture
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :status, presence: true
  validates :picture, presence: true
end
