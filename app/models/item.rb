class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :day

  with_options presence: true do
    validates :title
    validates :text
    validates :charge, numericality: { greater_than: 299, less_than: 10000000 }
    validates :image
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :burden_id
    validates :prefecture_id
    validates :day_id
  end
end
