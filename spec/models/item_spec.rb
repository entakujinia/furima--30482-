require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '全ての入力条件を満たしたら送信できる' do
      it 'nicknameとemail、passwordとcategory_idとstatus_idとdelivery_days_idとdelivery_fee_idとdelivery_area_idとpriceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    it 'image(画像)がない場合は登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'name(名前)がない場合は登録できないこと' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'description(説明)がない場合は登録できないこと' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'category_id(カテゴリーの選択)がない場合は登録できないこと' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
    end

    it 'category_id(カテゴリーの選択)が1の場合は登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it 'status_id(商品の状態)の選択がない場合は登録できないこと' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank", 'Status is not a number')
    end

    it 'status_id(商品の状態)が1の場合は登録できないこと' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Status must be other than 1')
    end

    it 'delivery_fee_id(発送料の負担)の選択がない場合は登録できないこと' do
      @item.delivery_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank", 'Delivery fee is not a number')
    end

    it 'delivery_fee_id(発送料の負担)が1の場合は登録できないこと' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
    end

    it 'delivery_area_id(発送元の地域)の選択がない場合は登録できないこと' do
      @item.delivery_area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery area can't be blank", 'Delivery area is not a number')
    end

    it 'delivery_area_id(発送元の地域)が1の場合は登録できないこと' do
      @item.delivery_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery area must be other than 1')
    end

    it 'delivery_days_id(発送までの日数)の選択がない場合は登録できないこと' do
      @item.delivery_days_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery days can't be blank", 'Delivery days is not a number')
    end

    it 'delivery_days_id(発送までの日数)が1の場合は登録できないこと' do
      @item.delivery_days_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery days must be other than 1')
    end

    it 'price(価格)の入力がない場合は登録できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'price(値段)が300以上でないと登録できないこと' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than 300')
    end

    it 'price(値段)が9999999以下でないと登録できないこと' do
      @item.price = 19_999_999_999_999
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than 9999999')
    end
  end
end
