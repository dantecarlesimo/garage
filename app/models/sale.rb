class Sale < ActiveRecord::Base
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/missing.jpg"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  validates :title, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :zipcode, presence: true

  belongs_to :user
  has_many :items

  accepts_nested_attributes_for :items
  
end