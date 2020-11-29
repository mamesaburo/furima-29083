class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_area
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :shipping_cost_id, numericality: { other_than: 1 }
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :shipping_days_id, numericality: { other_than: 1 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/ }
  end
end
