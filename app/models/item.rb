class Item < ApplicationRecord
  belongs_to :admins, optional: true
  attachment :picture
end
