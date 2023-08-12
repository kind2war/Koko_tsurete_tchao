class Park < ApplicationRecord
  has_many :change_requests, dependent: :destroy
  has_many :features, dependent: :destroy
  has_many :reviews, dependent: :destroy
  #has_many :review_comments, dependent: :destroy

  def self.import(file)
    CSV.foreach(file.path, headers: true, encoding: 'Shift_JIS:UTF-8') do |row|
      # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
      park = find_by(id: row["id"]) || new
      # CSVからデータを取得し、設定する
      park.attributes = row.to_hash.slice(*updatable_attributes)
      # 保存する
      park.save
    end
  end

    # 更新を許可するカラムを定義
  def self.updatable_attributes
    ["id", "park_name", "address","park_type","latitude","longitude"]
  end


end
