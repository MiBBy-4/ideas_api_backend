class Customer < ApplicationRecord
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :ideas
  has_many :reactions 
  has_many :responses
end
