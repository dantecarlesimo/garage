class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true         #User must have a name
  validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }

end
