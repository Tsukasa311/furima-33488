class OrderItem
  include ActiveModel::Model

  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number ,:user_id, :item_id, :token

   with_options presence: true do
    validates :postcode,          format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id,     numericality: { other_than: 1 }
    validates :city
    validates :block
    validates :phone_number,       numericality: true
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Buyer.create(order_id: order.id,postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number )
  end
end