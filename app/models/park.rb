class Park < ApplicationRecord
  has_many :change_requests, dependent: :destroy
  has_many :features, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :members, through: :reviews
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  #has_many :review_comments, dependent: :destroy

  def current_position
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true, encoding: 'Shift_JIS:UTF-8') do |row|
      park = find_by(id: row["id"]) || new
      park.attributes = row.to_hash.slice(*updatable_attributes)
      park.save
    end
  end

    # 更新を許可するカラムを定義
  def self.updatable_attributes
    ["id", "park_name", "address","park_type","latitude","longitude"]
  end

 def self.ransackable_attributes(auth_object = nil)
    ["address", "feature_id", "id", "park_name", "park_type"]
 end

end
