require 'rails_helper'

RSpec.describe PurchasedItemAddress, type: :model do
  before do
    @purchased_item_address = FactoryBot.build(:purchased_item_address)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it "postal_codeとshipping_area_id、cityとaddress_detail、phone_numberとtokenが存在すれば登録できる" do
        expect(@purchased_item_address).to be_valid
      end
      it "postal_codeが半角のハイフンを含んだ正しい形式である場合、登録できる" do
        @purchased_item_address.postal_code = "123-4567"
        expect(@purchased_item_address).to be_valid
      end
      it "buildingは空でも登録できる" do
        @purchased_item_address.building = ""
        expect(@purchased_item_address).to be_valid
      end
      it "phone_numberが半角のハイフンを含まない正しい形式である場合、登録できる" do
        @purchased_item_address.phone_number = "09012345678" 
        expect(@purchased_item_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it "postal_codeが空では登録できない" do
        @purchased_item_address.postal_code = ""
        @purchased_item_address.valid?
        expect(@purchased_item_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeが半角のハイフンを含んだ正しい形式でない場合、登録できない" do
        @purchased_item_address.postal_code = "1234567"
        @purchased_item_address.valid?
        expect(@purchased_item_address.errors.full_messages).to include("Postal code Input correctly")
      end
      it "shipping_area_idを選択しなければ登録できない" do
        @purchased_item_address.shipping_area_id = ""
        @purchased_item_address.valid?
        expect(@purchased_item_address.errors.full_messages).to include("Shipping area Select")
      end
      it "cityが空では登録できない" do
        @purchased_item_address.city = ""
        @purchased_item_address.valid?
        expect(@purchased_item_address.errors.full_messages).to include("City can't be blank")
      end
      it "address_detailが空では登録できない" do
        @purchased_item_address.address_detail = ""
        @purchased_item_address.valid?
        expect(@purchased_item_address.errors.full_messages).to include("Address detail can't be blank")
      end
      it "phone_numberが空では登録できない" do
        @purchased_item_address.phone_number = ""
        @purchased_item_address.valid?
        expect(@purchased_item_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberにハイフンがある場合、登録できない" do
        @purchased_item_address.phone_number = "12345-6789"
        @purchased_item_address.valid?
        expect(@purchased_item_address.errors.full_messages).to include("Phone number Input only number")
      end
      it "phone_numberが全角数字の場合、登録できない" do
        @purchased_item_address.phone_number = "１２３４５"
        @purchased_item_address.valid?
        expect(@purchased_item_address.errors.full_messages).to include("Phone number Input only number")
      end
      it "tokenが空では登録できない" do
        @purchased_item_address.token = nil
        @purchased_item_address.valid?
        expect(@purchased_item_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

