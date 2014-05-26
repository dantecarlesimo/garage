class Item < ActiveRecord::Base

  validates :name, presence: true
  validates :price, presence: true
  validates :sale_id, presence: true
 
  belongs_to :sale
  has_one :transaction
  
end
