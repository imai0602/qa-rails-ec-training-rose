class User < ApplicationRecord
  #パスワード(半角英数字)
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/
  #郵便番号(ハイフン有り、3桁-4桁)
  VALID_ZIPCODE_REGEX = /\A\d{3}-\d{4}\z/
  #メールアドレス
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #電話番号(ハイフン無し、半角数字)
  VALID_PHONE_REGEX = /\A[0-9]+\z/

  validates :password, presence: true, length: {minimum: 6, maximum: 15}, format: { with: VALID_PASSWORD_REGEX }
  validates :last_name, presence: true, length: {maximum: 10}
  validates :first_name, presence: true, length: {maximum: 10}
  validates :zipcode, presence: true, format: { with: VALID_ZIPCODE_REGEX }
  validates :prefecture, presence: true, length: {maximum: 5}
  validates :municipality, presence: true, length: {maximum: 10}
  validates :address, presence: true, length: {maximum: 15}
  validates :apartments, presence: true, length: {maximum: 20}
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :phone_number, presence: true, length: { maximum: 15 }, format: { with: VALID_PHONE_REGEX }

  belongs_to :user_classification
end
