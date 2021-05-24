class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_destination = PurchaseDestination.new
  end

  private

  # def purchase_params
  #   item = Item.find(params[:item_id])
  #   params.require(:purchase_destination).permit(:postal_code, :area_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: item_id)
  # end

end
