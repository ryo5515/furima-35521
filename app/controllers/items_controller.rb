class ItemsController < ApplicationController
  def index
  end

  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :status_id, :burden_id, :area_id, :days_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

end
