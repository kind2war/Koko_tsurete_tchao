class Feature < ApplicationRecord
  has_many :park_feature_relations, dependent: :destroy
  has_many :parks, through: :park_feature_relations, dependent: :destroy
  validates :feature_detail, presence:true, length:{maximum:50}
end
