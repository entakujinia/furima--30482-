class PurchasestreetAddress
  include ActiveModel::Model
  attr_accessor :post_code,:prefecture_id,:city,:address,:appointment_name,:phone_number,:user_id,:item_id,:token
  with_options presence: true do
    validates :post_code,      format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone_number,    format: { with: /\A\d{11}\z/ }
    validates :prefecture_id
    validates :city           
    validates :address        
    validates :token           
    validates :prefecture_id, numericality: { other_than: 1 }
  end

  def save
    purchase= Purchase.create(item_id: item_id, user_id: user_id)
    StreetAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, phone_number: phone_number, address: address, purchase: purchase) 
    
  end
end

