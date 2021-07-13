
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
    phone_number:"0000000000#{n + 1}",
    company_name:"探求学園",
    delete_flag: false,
    user_classification_id: user_classification.id
  )
end

SaleStatus.create!(
  sale_status_name: "販売中",
)

SaleStatus.create!(
  sale_status_name: "欠品中",
)

ProductStatus.create!(
  product_status_name: "良",
)

ProductStatus.create!(
  product_status_name: "傷あり",
)

Category.create!(
  category_name: "食料品",
)

Category.create!(
  category_name: "日用品",
)

Product.create!(
  product_name: "商品名1",
  category_id: 1,
  price: "1000",
  description: "探究学園限定商品1",
  sale_status_id: 1,
  product_status_id: 1,
  regist_date: "2021/7/10",
  user_id: 1,
  delete_flag: 'false'
)

Product.create!(
  product_name: "商品名2",
  category_id: 2,
  price: "2000",
  description: "探究学園限定商品2",
  sale_status_id: 2,
  product_status_id: 2,
  regist_date: "2021/7/20",
  user_id: 1,
  delete_flag: 'false'
)

Product.create!(
  product_name: "商品名3",
  category_id: 1,
  price: "1500",
  description: "探究学園限定商品3",
  sale_status_id: 1,
  product_status_id: 1,
  regist_date: "2021/7/11",
  user_id: 2,
  delete_flag: 'false'
)

Product.create!(
  product_name: "商品名4",
  category_id: 2,
  price: "2500",
  description: "探究学園限定商品4",
  sale_status_id: 2,
  product_status_id: 2,
  regist_date: "2021/7/22",
  user_id: 2,
  delete_flag: 'false'
)
