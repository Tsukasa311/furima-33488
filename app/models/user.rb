class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i.freeze
  VALID_NAME_KANA = /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/.freeze
  VALID_NAME = /\A[ぁ-んァ-ン一-龥]/.freeze

  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: VALID_NAME }
    validates :first_name, format: { with: VALID_NAME }
    validates :last_name_kana, format: { with: VALID_NAME_KANA }
    validates :first_name_kana, format: { with: VALID_NAME_KANA }
    validates :birthday
  end

  validates :password, format: { with: VALID_PASSWORD_REGEX }

  has_many :items
end
