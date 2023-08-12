class Prefecture < ApplicationRecord
  belongs_to :members
  has_many :cities
end
