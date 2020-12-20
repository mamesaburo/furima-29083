class PurchasedItemAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :address_detail, :building, :phone_number, :user_id, :item_id

  with_options presence: true  do
    validates :city
    validates :address_detail
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :shipping_area_id, numericality: { other_than: 0, message: "Select" }
    validates :phone_number, format: { with: /\A\d{11}\z/ }
  end

  def save
    PurchasedItem.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, address_detail: address_detail, building: building, phone_number: phone_number, purchased_item: purchased_item)
  end
end