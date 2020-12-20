class PurchasedItemsController < ApplicationController

  def index
    @item = Item.find_by(params[:id])
  end

  def create
    @purchased_item_address = PurchasedItemAddress.new(address_params)
    if @purchased_item_address.valid?
      @purchased_item_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def address_params
    params.require(:purchased_item_address).permit(:postal_code, :shipping_area_id, :city, :address_detail, :building, :phone_number).merge(user_id: current_user.id, item_id: item_id)
  end
end