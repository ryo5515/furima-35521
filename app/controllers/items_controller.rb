class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :status_id, :burden_id, :area_id, :day_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

end
