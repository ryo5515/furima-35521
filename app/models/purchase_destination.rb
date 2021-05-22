class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :purchase_id, :postal_code, :area_id, :municipality, :address, :building_name, :phone_number, :token
end