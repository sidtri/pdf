class SecondUser < ActiveRecord::Base
  attr_accessible :email, :name
  validates_presence_of :name  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates_length_of :name , maximum: 50

end
