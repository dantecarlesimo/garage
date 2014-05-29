class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  validates :user_id, presence: true
  validates :seller_id, presence: true
  validates :item_id, presence: true, uniqueness: true
end
