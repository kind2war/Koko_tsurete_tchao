class ChangeRequest < ApplicationRecord
  belongs_to :member
  belongs_to :park

  validates :order_detail, presence: true, length: { maximum: 1000 }
end
