class PurchasedItemsController < ApplicationController
  before_action :move_to_index, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @purchased_item_address = PurchasedItemAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchased_item_address = PurchasedItemAddress.new(address_params)
    if @purchased_item_address.valid?
      pay_item
      @purchased_item_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def address_params
    params.require(:purchased_item_address).permit(:postal_code, :shipping_area_id, :city, :address_detail, :building, :phone_number, :item_id).merge(user_id: current_user.id, token: params[:token])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: address_params[:token],
      currency: 'jpy'
    )
  end
end