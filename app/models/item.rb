class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_area
  has_one_attached :image
  belongs_to       :user
  #has_one          :purchase

  validates :image, :name, :description, :category_id, :status_id, :delivery_days_id, :delivery_fee_id, :delivery_area_id, :price, presence: true
  validates :price, numericality: { only_integer: true,  greater_than: 300, less_than: 9999999}
  
  validates :category_id, :status_id, :delivery_days_id, :delivery_fee_id, :delivery_area_id, numericality: { other_than: 1 }
end

