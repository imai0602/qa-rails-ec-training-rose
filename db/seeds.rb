
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

["販売中","欠品中"].each do |sale_status|
  SaleStatus.create!(
    sale_status_name: sale_status
  )
end

["良","傷あり"].each do |product_status|
  ProductStatus.create!(
    product_status_name: product_status
  )
end

["食料品","日用品"].each do |category|
  Category.create!(
    category_name: category
  )
end

Product.create!(
  product_name: "商品名1",
  category_id: 1,
  price: 1000,
  description: "探究学園限定商品1",
  sale_status_id: 1,
  product_status_id: 1,
  regist_date: "2021/7/10",
  user_id: 1,
  delete_flag: false
)

Product.create!(
  product_name: "商品名2",
  category_id: 2,
  price: 2000,
  description: "探究学園限定商品2",
  sale_status_id: 2,
  product_status_id: 2,
  regist_date: "2021/7/20",
  user_id: 1,
  delete_flag: false
)

Product.create!(
  product_name: "商品名3",
  category_id: 1,
  price: 1500,
  description: "探究学園限定商品3",
  sale_status_id: 1,
  product_status_id: 1,
  regist_date: "2021/7/11",
  user_id: 2,
  delete_flag: false
)

Product.create!(
  product_name: "商品名4",
  category_id: 2,
  price: 2500,
  description: "探究学園限定商品4",
  sale_status_id: 2,
  product_status_id: 2,
  regist_date: "2021/7/22",
  user_id: 2,
  delete_flag: false
)

["準備中","発送中"].each do |shipment_status|
  ShipmentStatus.create!(
    shipment_status_name: shipment_status
  )
end

Order.create!(
  user_id: 1,
  order_date: Time.zone.parse("2021-07-17 15:30:59"),
  order_number: "1313131313"
)

Order.create!(
  user_id: 2,
  order_date: Time.zone.parse("2021-07-17 15:35:59"),
  order_number: "2424242424"
)

OrderDetail.create!(
  order_id: 1,
  product_id: 1,
  shipment_status_id: 1,
  order_detail_number: "1111111111",
  order_quantity: 10,
  shipment_date: Time.zone.parse("2021-07-17 15:30:59"),
)

OrderDetail.create!(
  order_id: 1,
  product_id: 2,
  shipment_status_id: 2,
  order_detail_number: "2222222222",
  order_quantity: 20,
  shipment_date: Time.zone.parse("2021-07-17 15:30:59"),
)

OrderDetail.create!(
  order_id: 1,
  product_id: 3,
  shipment_status_id: 1,
  order_detail_number: "3333333333",
  order_quantity: 30,
  shipment_date: Time.zone.parse("2021-07-17 15:30:59"),
)

OrderDetail.create!(
  order_id: 1,
  product_id: 4,
  shipment_status_id: 2,
  order_detail_number: "4444444444",
  order_quantity: 40,
  shipment_date: Time.zone.parse("2021-07-17 15:30:59"),
)

OrderDetail.create!(
  order_id: 2,
  product_id: 1,
  shipment_status_id: 1,
  order_detail_number: "5555555555",
  order_quantity: 50,
  shipment_date: Time.zone.parse("2021-07-17 15:35:59"),
)

OrderDetail.create!(
  order_id: 2,
  product_id: 2,
  shipment_status_id: 2,
  order_detail_number: "6666666666",
  order_quantity: 60,
  shipment_date: Time.zone.parse("2021-07-17 15:35:59"),
)

OrderDetail.create!(
  order_id: 2,
  product_id: 3,
  shipment_status_id: 1,
  order_detail_number: "7777777777",
  order_quantity: 70,
  shipment_date: Time.zone.parse("2021-07-17 15:35:59"),
)

OrderDetail.create!(
  order_id: 2,
  product_id: 4,
  shipment_status_id: 2,
  order_detail_number: "8888888888",
  order_quantity: 80,
  shipment_date: Time.zone.parse("2021-07-17 15:35:59"),
)