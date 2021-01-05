class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i
  VALID_LAST_NAME_KANA = /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/
  VALID_FIRST_NAME_KANA = /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/

  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true ,format: { with: VALID_LAST_NAME_KANA }
  validates :first_name_kana, presence: true, format: { with: VALID_FIRST_NAME_KANA}
  validates :birthday,presence: true
  validates :password, format: { with: VALID_PASSWORD_REGEX }

end
