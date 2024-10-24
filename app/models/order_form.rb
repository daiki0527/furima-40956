class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :city, :address, :building, :telephone_number, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid.' }
    validates :user_id
    validates :item_id
    validates :city
    validates :address
    validates :token
  end
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id:, item_id:)
    Sending.create(postal_code:, area_id:, city:, address:, building:,
                   telephone_number:, order_id: order.id)
  end
end
