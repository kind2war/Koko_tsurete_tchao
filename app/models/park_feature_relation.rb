class ParkFeatureRelation < ApplicationRecord
  belongs_to :park
  belongs_to :feature
end
