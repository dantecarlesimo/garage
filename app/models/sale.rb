class Sale < ActiveRecord::Base

  validates :title, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :zipcode, presence: true

  belongs_to :user
  has_many :items
  
end
