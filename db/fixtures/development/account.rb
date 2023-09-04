#管理者アカウントの作成
  admin = [{email: 'admin@example.com', password:'ENV[PS_ADMIN]' }]
  admin.each do |record|
    Admin.create!(record) unless Admin.find_by(email: record[:email])
  end

#メンバーアカウント
  member = [{email: '1111@example.com', password: '111111',sex:1 ,birth_date: '1991-01-01', account_name: 'TEST1'}]
  member.each do |record|
    Member.create!(record) unless Member.find_by(email: record[:email])
  end