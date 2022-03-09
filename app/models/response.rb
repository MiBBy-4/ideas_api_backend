class Response < ApplicationRecord
  validates :customer_id, uniqueness: { scope: :idea_id }
  belongs_to :customer
  belongs_to :idea
end
