class ReviewComment < ApplicationRecord
  belongs_to :member
  belongs_to :park
  #belongs_to :review

  validates :comment, presence: true
end
