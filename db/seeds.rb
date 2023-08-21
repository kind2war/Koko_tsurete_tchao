#都道府県と市区町村のデータベース保存
#require 'csv'

#CSVROW_PREFNAME = 6
#CSVROW_CITYNAME = 7

#CSV.foreach('db/csv/KEN_ALL.CSV', encoding: "Shift_JIS:UTF-8") do |row|
#  prefecture_name = row[CSVROW_PREFNAME]
#  city_name = row[CSVROW_CITYNAME]
#  prefecture = Prefecture.find_or_create_by(name: prefecture_name)
#  City.find_or_create_by(name: city_name, prefecture_id: prefecture.id)
#end

#横須賀市の公園のデータベース保存※特徴などは未記載の軽量版
#require 'csv'
#
#def upsert_seeds(model: )
#  now = Time.zone.now
#  timestamps = { created_at: now, updated_at: now }
#  file = File.read("db/csv/#{model.to_s.underscore.pluralize}.csv", encoding: "Shift_JIS:UTF-8")
#  records = CSV.parse(file, headers: true).map do |row|
#    row.to_h.merge(timestamps)
#  end
#  model.upsert_all(records)
#end

#upsert_seeds(model: Park)

  CSV.foreach('db/csv/parks.csv', headers: true,  encoding: "Shift_JIS:UTF-8") do |row|
    parks = [
      {id: row['id']},
      {park_name: row['park_name']},
      {address: row['address']},
      {park_type: row['park_type']},
      {latitude: row['latitude']},
      {longitude: row['longitude']},
      ]

    parks.each do |park|
    Park.find_or_create_by(park)
  end
end


#管理者アカウントの作成
  admin = [{email: 'sample@example.com', password:'000000' }]
  admin.each do |record|
    Admin.create!(record) unless Admin.find_by(email: record[:email])
  end

#メンバーアカウント
  member = [{email: '1111@example.com', password: '111111',sex:1 ,birth_date: '1991-01-01', account_name: 'TEST1'}]
  member.each do |record|
    Member.create!(record) unless Member.find_by(email: record[:email])
  end

#初期タグの作成
  features = [
    {id: 1, feature_detail: 'トイレ'},
    {id: 2, feature_detail: '多機能トイレ'},
    {id: 3, feature_detail: '水飲み場・手洗い場'},
    {id: 4, feature_detail: '駐車場'},
    ]

  features.each do |feature|
  Feature.find_or_create_by(feature)
  end