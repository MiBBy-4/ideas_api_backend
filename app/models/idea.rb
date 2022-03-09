class Idea < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 250 }
  validates :problem, presence: true
  validates :sphere, presence: true
  validates :geo_focus, presence: true
  validates :investor_requirements, presence: true
  validates_associated :customer

  belongs_to :customer
  has_many :reactions, dependent: :delete_all
end
