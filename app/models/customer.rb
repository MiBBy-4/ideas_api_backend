class Customer < ApplicationRecord
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, confirmation: { case_sensitive: false }
  validates :name, presence: true, length: { in: 1..50 }
  validates :surname, presence: true, length: { in: 1..50 }
  validates :skype, presence: true, length: { in: 1..50 }

  has_many :ideas
  has_many :reactions 
  has_many :responses
end
