
user_classification = UserClassification.create!(
  user_classification_name: "一般ユーザー"
)

2.times do |n|
  user = User.create!(
    password:"testpass",
    last_name:"太郎#{n + 1}",
    first_name:"探求#{n + 1}",
    zipcode:"000-0000",
    prefecture:"東京都",
    municipality:"探求区",
    address:"0-0",
    apartments:"探求学園10#{n + 1}",
    email:"e#{n + 1}@example.com",
    phone_number:"000-0000-000#{n + 1}",
    company_name:"探求学園",
    delete_flag: false,
    user_classification_id: user_classification.id
  )
end

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
