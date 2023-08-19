class Review < ApplicationRecord
  belongs_to :member
  belongs_to :park
  #has_many :review_comments, dependent: :destroy
  validates :title, presence: true, length: { maximum: 50 }
  validates :review_detail, presence: true, length: { maximum: 1000 }
  
end
