class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :municipality, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'にはハイフンを入れてください' }
    validates :area_id, numericality: { other_than: 1, message: 'を選択してください'}
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'にはハイフンを入れずに11桁以内の数字を入力してください' }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Destination.create(postal_code: postal_code, area_id: area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end