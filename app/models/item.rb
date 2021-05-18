class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category_id
  belongs_to_active_hash :status_id
  belongs_to_active_hash :burden_id
  belongs_to_active_hash :area_id
  belongs_to_active_hash :days_delivery_id
  
end
