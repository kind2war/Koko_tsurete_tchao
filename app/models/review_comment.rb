class ReviewComment < ApplicationRecord
  belongs_to :member
  belongs_to :review
  belongs_to :park
  validates :comment, presence: true
end
