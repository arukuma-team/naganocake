class Item < ApplicationRecord
  belongs_to :admins
  attachment :image
end
