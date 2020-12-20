class Address < ApplicationRecord
  belongs_to :purchased_item

  with_options presence: true  do
    validates :city
    validates :address_detail
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :shipping_area_id, numericality: { other_than: 0, message: "Select" }
    validates :phone_number, format: { with: /\A\d{11}\z/ }
  end
end