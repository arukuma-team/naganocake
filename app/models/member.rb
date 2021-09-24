class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one :order, dependent: :destroy

  has_many :address, dependent: :destroy


  include Discard::Model
  default_scope -> { kept }
  def active_for_authentication?
    super && kept?
  end
  
  def full_name
    self.first_name + self.last_name
  end

end
