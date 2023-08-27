#横須賀市の公園のデータベース保存
require 'csv'

  csv = CSV.read('db/csv/parks.csv', headers: true,  encoding: "Shift_JIS:UTF-8")
  csv.each do |row|
  	id = row[0]
  	park_name = row[1]
  	address = row[2]
  	park_type = row[3]
  	latitude = row[4]
  	longitude = row[5]
  	area = row[6]
  	size = row[7]
  	size_rank = row[8]

	Park.seed(:id) do |s|
		s.id = id
		s.park_name = park_name
		s.address = address
		s.park_type = park_type
		s.latitude = latitude
		s.longitude = longitude
		s.area = area
		s.size = size
		s.size_rank = size_rank
	end
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