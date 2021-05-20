class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create, :edit]

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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless @item.user.id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :status_id, :burden_id, :area_id, :day_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

end
