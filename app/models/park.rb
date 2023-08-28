class Park < ApplicationRecord
  has_many :change_requests, dependent: :destroy
  has_many :park_feature_relations, dependent: :destroy
  has_many :features, through: :park_feature_relations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :members, through: :reviews
  has_many_attached :images
  validates :park_name, :address, :latitude, :longitude, presence: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  #has_many :review_comments, dependent: :destroy

  def self.import(file)
    CSV.foreach(file.path, headers: true, encoding: 'Shift_JIS:UTF-8') do |row|
      park = find_by(id: row["id"]) || new
      park.attributes = row.to_hash.slice(*updatable_attributes)
      park.save
    end
  end

  def self.updatable_attributes
    ["id", "park_name", "address","park_type","latitude","longitude","feature_ids","size","area","size_rank"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["address", "feature_id", "id", "park_name", "park_type","area","size_rank","size"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["change_requests", "features", "image_attachments", "image_blobs", "members", "park_feature_relations", "reviews"]
  end

  #新規登録時の公園分類の選択肢
  PARK_TYPE = [
    '運動公園',
    '近隣公園',
    '街区公園',
    '特殊公園（風致公園、動植物公園、歴史公園、墓園）',
    '地区公園（カントリーパーク）',
    'その他'
    ]
  def self.park_type_options
    PARK_TYPE.map{|type|[type,type]}
  end

  AREA = [
    '追浜エリア',
    '田浦エリア',
    '逸見エリア',
    '市役所エリア	',
    '大津エリア',
    '衣笠エリア',
    '浦賀エリア',
    '西エリア',
    '久里浜エリア',
    '北下浦エリア'
    ]
  def self.area_options
    AREA.map{|type|[type,type]}
  end

end
