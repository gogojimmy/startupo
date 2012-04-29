#encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ResourceType.create!(:name => "資金", :description => "資金")
ResourceType.create!(:name => "團隊", :description => "團隊")
ResourceType.create!(:name => "供應商", :description => "供應商")
ResourceType.create!(:name => "製造技術", :description => "製造技術")
ResourceType.create!(:name => "相關通路", :description => "相關通路")
ResourceType.create!(:name => "營銷策略", :description => "營銷策略")
ResourceType.create!(:name => "人脈資源", :description => "人脈資源")
ResourceType.create!(:name => "活動配合", :description => "活動配合")
ResourceType.create!(:name => "策略聯盟", :description => "策略聯盟")
ResourceType.create!(:name => "其他", :description => "其他")

CooperateWay.create!(:name => "個案配合", :description => "個案配合")
CooperateWay.create!(:name => "代銷", :description => "代銷")
CooperateWay.create!(:name => "加盟", :description => "加盟")
CooperateWay.create!(:name => "貿易", :description => "貿易")
CooperateWay.create!(:name => "委託製造", :description => "委託製造")
CooperateWay.create!(:name => "技術合作", :description => "技術合作")
CooperateWay.create!(:name => "融資", :description => "融資")
CooperateWay.create!(:name => "尋找執行團隊", :description => "尋找執行團隊")
CooperateWay.create!(:name => "學術合作", :description => "學術合作")
CooperateWay.create!(:name => "其他", :description => "其他")
