class Park < ApplicationRecord
  has_many :change_requests, dependent: :destroy
  has_many :features, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
