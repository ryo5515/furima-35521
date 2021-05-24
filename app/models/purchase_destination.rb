class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :purchase_id, :postal_code, :area_id, :municipality, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :area_id, numericality: { other_than: 1, message: 'Select'}
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'Input only number' }
  end
end