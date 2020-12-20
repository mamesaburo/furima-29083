class PurchasedItemsController < ApplicationController

  def index
    @item = Item.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :shipping_area_id, :city, :address_detail, :building, :phone_number, :purchased_item_id)
  end
  
end