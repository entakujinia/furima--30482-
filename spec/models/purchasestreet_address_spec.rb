# require 'rails_helper'

# RSpec.describe PurchasestreetAddress, type: :model do
#   before do
#     @purchase_street_address = FactoryBot.build(:order)
#   end

#   it 'すべての値が正しく入力されていれば保存できること' do
#     expect(@purchase_street_address).to be_valid
#   end
#   it 'tokenがあれば保存ができること' do
#     expect(@purchase_street_address).to be_valid
#   end
#   it 'appointment_nameは空でも保存できること' do
#     @purchase_street_address.building_name = nil
#     expect(@purchase_street_address).to be_valid
#   end
#   it 'tokenが空では登録できないこと' do
#     @purchase_street_address.token = nil
#     @purchase_street_address.valid?
#     expect(@purchase_street_address.errors.full_messages).to include("")
#   end
#   it 'post_codeが空だと保存できないこと' do
#     @purchase_street_address.post_code = ''
#     @purchase_street_address.valid?
#     expect(@purchase_street_address.errors.full_messages).to include("")
#   end
#   it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
#     @purchase_street_address.post_code = '1234567'
#     @purchase_street_address.valid?
#     expect(@purchase_street_address.errors.full_messages).to include("")
#   end
#   it 'prefecture_idが1の場合保存できないこと' do
#     @purchase_street_address.prefecture_id = 1
#     @purchase_street_address.valid?
#     expect(@purchase_street_address.errors.full_messages).to include("")
#   end
#   it 'cityが空だと保存できないこと' do
#     @purchase_street_address.city= ''
#     @purchase_street_address.valid?
#     expect(@purchase_street_address.errors.full_messages).to include("")
#   end
#   it 'addressが空だと保存できないこと' do
#     @purchase_street_address.address= ''
#     @purchase_street_address.valid?
#     expect(@purchase_street_address.errors.full_messages).to include("")
#   end
#   it 'phone_numberが空だと保存できないこと' do
#     @purchase_street_address.phone_number= ''
#     @purchase_street_address.valid?
#     expect(@purchase_street_address.errors.full_messages).to include("")
#   end
#   it 'phone_numberが半角のハイフンを含まない正しい形式でないと保存できないこと' do
#     @purchase_street_address.phone_number = '000-2345-3445'
#     @purchase_street_address.valid?
#     expect(@purchase_street_address.errors.full_messages).to include("")
#   end
# end
