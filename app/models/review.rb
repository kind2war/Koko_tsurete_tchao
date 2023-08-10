class Review < ApplicationRecord
  belongs_to :member
  validates :review_detail, presence: true, length: { maximum: 1000 }
end
