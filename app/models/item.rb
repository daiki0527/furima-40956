class Item < ApplicationRecord
  belongs_to :user
  has_one    :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :area
  belongs_to :delivery_day

  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 },
                    format: { with: /\A[0-9]+\z/, message: 'Price is invalid.harf-width characters' }
  validates :image, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :charge_id, presence: true
  validates :area_id, presence: true
  validates :delivery_day_id, presence: true

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" }
end
