class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :set_action, only: [:edit, :update]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :status_id, :burden_id, :area_id, :day_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_action
    unless @item.user.id == current_user.id
      redirect_to action: :index
    end
  end

end
