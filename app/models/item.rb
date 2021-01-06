class Item < ApplicationRecord
  belongs_to :User
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
    validates :charge
  end
  with_options numericality: { other_than: 1 } do
    validates :category
    validates :state
    validates :burden
    validates :prefecture
    validates :day
  end
end
