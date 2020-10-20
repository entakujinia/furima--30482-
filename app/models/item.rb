class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_area
  has_one_attached :image
  #belongs_to       :user
  #has_one          :purchase

  validates :image, :name, :description, :category, :status, :delivery_days, :delivery_fee, :delivery_area, :price, presence: true

  
  validates :category_id, :status_id, :delivery_days_id, :delivery_fee_id, :delivery_area_id, numericality: { other_than: 1 }
end

