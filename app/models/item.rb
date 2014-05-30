class Item < ActiveRecord::Base

  has_attached_file :photo, :styles => { :large => "500x500#", :medium => "300x300#", :thumb => "200x200#" }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
 
  belongs_to :sale
  has_one :transaction
  
end
