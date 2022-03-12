class Idea < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 250 }
  validates :problem, presence: true, length: { maximum: 1000 }
  validates :sphere, presence: true, length: { maximum: 50 }
  validates :geo_focus, presence: true, length: { maximum: 50 }
  validates :investor_requirements, presence: true, length: { maximum: 1000 }
  validates :team, presence: true, length: { maximum: 250 }
  validates :next_steps, presence: true, length: { maximum: 1000 }  
  validates_associated :customer

  belongs_to :customer
  has_many :reactions, dependent: :delete_all
  has_many :responses, dependent: :delete_all
end
