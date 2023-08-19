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

#CSV.foreach('db/csv/parks.csv', headers: true,  encoding: "Shift_JIS:UTF-8") do |row|
#  Park.create(
#    id: row['id'],
#    park_name: row['park_name'],
#    address: row['address'],
#    park_type: row['park_type'],
#    latitude: row['latitude'],
#    longitude: row['longitude']
#  )
#end

#管理者アカウントの作成
  admin = [{email: 'sample@example.com', password:'000000' }]
  admin.each do |record|
    Admin.create!(record) unless Admin.find_by(email: record[:email])
  end

#初期タグの作成
  feature = [
    {feature_detail: 'トイレ'},
    {feature_detail: '多機能トイレ'},
    {feature_detail: '水飲み場・手洗い場'},
    {feature_detail: '駐車場'}
    ]
  feature.each do |record|
    Feature.create!(record) unless Feature.find_by(feature_detail: record[:feature_detail])
  end