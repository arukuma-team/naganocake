class Address < ApplicationRecord
  belongs_to :member
  
  validates :name, :address, presence: true
  validates :zip, length: {is: 7}, numericality: { only_integer: true }
  
  def view_address
    "〒" + self.zip.to_s + "　" + self.address + "　" + self.name
  end

end
