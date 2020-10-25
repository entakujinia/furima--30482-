require 'rails_helper'

RSpec.describe PurchasestreetAddress, type: :model do
  describe '購入機能' do
    before do
      @purchase_street_address = FactoryBot.build(:purchasestreet_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_street_address).to be_valid
    end

    it 'tokenがあれば保存ができること' do
      expect(@purchase_street_address).to be_valid
    end

    it 'tokenが空では登録できないこと' do
      @purchase_street_address.token = ''
      @purchase_street_address.valid?
      expect(@purchase_street_address.errors.full_messages).to include("Token can't be blank")
    end

    it 'post_codeが空だと保存できないこと' do
      @purchase_street_address.post_code = ''
      @purchase_street_address.valid?
      expect(@purchase_street_address.errors.full_messages).to include("Post code can't be blank", 'Post code is invalid')
    end

    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_street_address.post_code = '1234567'
      @purchase_street_address.valid?
      expect(@purchase_street_address.errors.full_messages).to include('Post code is invalid')
    end

    it 'prefecture_idが1の場合保存できないこと' do
      @purchase_street_address.prefecture_id = 1
      @purchase_street_address.valid?
      expect(@purchase_street_address.errors.full_messages).to include('Prefecture must be other than 1')
    end

    it 'cityが空だと保存できないこと' do
      @purchase_street_address.city = ''
      @purchase_street_address.valid?
      expect(@purchase_street_address.errors.full_messages).to include("City can't be blank")
    end

    it 'addressが空だと保存できないこと' do
      @purchase_street_address.address = ''
      @purchase_street_address.valid?
      expect(@purchase_street_address.errors.full_messages).to include("Address can't be blank")
    end

    it 'phone_numberが空だと保存できないこと' do
      @purchase_street_address.phone_number = ''
      @purchase_street_address.valid?
      expect(@purchase_street_address.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid')
    end

    it 'phone_numberが半角のハイフンを含まない正しい形式でないと保存できないこと' do
      @purchase_street_address.phone_number = '000-2345-3445'
      @purchase_street_address.valid?
      expect(@purchase_street_address.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
