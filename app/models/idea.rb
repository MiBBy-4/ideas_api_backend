class Idea < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 250 }
  validates :problem, presence: true
  validates :sphere, presence: true
  validates :geo_focus, presence: true
  validates :investor_requirements, presence: true
end
