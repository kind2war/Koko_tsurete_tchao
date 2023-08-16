class Feature < ApplicationRecord
  has_many :park_feature_relations, dependent: :destroy
  has_many :parks, through: :park_feature_relations, dependent: :destroy
end
