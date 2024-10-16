class OrderForm
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building, :telephone_number

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :telephone_number, format: { with: /\Ad{10}$|^\d{11}\z/, message: 'is invalid.' }
    validates :user_id
    validates :item_id
    validates :city
    validates :address
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id:, item_id:)
    Sending.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, telephone_number: telephone_number, order_id: order_id)
  end
end
