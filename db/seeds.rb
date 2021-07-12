# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.all.each do |user|
  user.products.create!(
    [
      {
        product_name: "商品名1",
        price: "1000",
        description: "探究学園限定商品1",
        regist_date: "2021/7/10",
        user_id: 1,
        delete_flag: 'false'
      },
      {
        product_name: "商品名2",
        price: "2000",
        description: "探究学園限定商品2",
        regist_date: "2021/7/20",
        user_id: 1,
        delete_flag: 'false'
      }
      {
        product_name: "商品名3",
        price: "1500",
        description: "探究学園限定商品3",
        regist_date: "2021/7/11",
        user_id: 2,
        delete_flag: 'false'
      },
      {
        product_name: "商品名4",
        price: "2500",
        description: "探究学園限定商品4",
        regist_date: "2021/7/22",
        user_id: 2,
        delete_flag: 'false'
      }
    ]
  )
end

['販売中','欠品中'].each do |sale_status|
  Product.sale_statuses.create!(
    { sale_status_name: sale_status}
  )

['良','傷あり'].each do |product_status|
  Product.product_statuses.create!(
    { product_status_name: product_status}
  )

['食料品','日用品'].each do |category|
  Product.categories.create!(
    { category_name: category}
  )
