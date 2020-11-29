class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:images, :name, :description, :price, :condition_id, :shipping_cost_id, :shipping_area_id, :shipping_days_id, :category_id, :user).merge(user_id: current_user.id)
  end
end