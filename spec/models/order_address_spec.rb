require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do 
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id,)
    sleep 0.2 # エラー対策で0.2秒待機させてます
  end

  describe '商品購入機能' do
    context '商品購入できるとき'  do
      it '全ての項目の値が適切であれば購入できる' do
        expect(@order_address).to be_valid
      end

      it 'buildingは空でも購入できる' do
        @order_address.building = nil
        expect(@order_address).to be_valid
      end 
    end
      
    context '商品購入できないとき' do
      it 'posta_codeが空では購入できない' do
        @order_address.postal_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフンがないと購入できない' do
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'shipping_area_idが1では購入できない' do
        @order_address.shipping_area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipping area must be other than 1")
      end

      it 'cityが空では購入できない' do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空では購入できない' do
        @order_address.house_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空では購入できない' do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが12桁以上では購入できない' do
        @order_address.phone_number = "090123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it 'phone_numberが英数混合では購入できない' do
        @order_address.phone_number = "090abcd1234"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is not a number")
      end

      it 'tokenが空では購入できない' do
        @order_address.token = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'userが紐づいていないと購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end 
      
      it 'itemが紐づいていないと購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end       
    end
  end
end
