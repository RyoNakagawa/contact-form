# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

inquiry_kinds = [
  {id: 1, name: '製品について'},
  {id: 2, name: '注文について'},
  {id: 3, name: '発送について'},
  {id: 4, name: '返品について'},
  {id: 5, name: 'その他'},
]

inquiry_kinds.each do |inquiry_kind|
  InquiryKind.find_or_create_by(inquiry_kind)
end
