require 'rails_helper'

RSpec.describe Item, type: :model do
  before do 
    @items = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき'  do
      it '全ての項目の値が適切であれば出品できる' do
        expect(@items).to be_valid
      end
    end

    context '商品出品できないとき' do
      it 'imageが空では登録できない' do
        @items.image = nil
        @items.valid?
        expect(@items.errors.full_messages).to include("Image can't be blank")
      end

      it 'item_nameが空では登録できない' do
        @items.item_name = ""
        @items.valid?
        expect(@items.errors.full_messages).to include("Item name can't be blank")
      end

      it 'item_textが空では登録できない' do
        @items.item_text = ""
        @items.valid?
        expect(@items.errors.full_messages).to include("Item text can't be blank")
      end

      it 'category_idが空では登録できない' do
        @items.category_id = ""
        @items.valid?
        expect(@items.errors.full_messages).to include("Category can't be blank")
      end

      it 'condition_idが空では登録できない' do
        @items.condition_id = ""
        @items.valid?
        expect(@items.errors.full_messages).to include("Condition can't be blank")
      end

      it 'who_costが空では登録できない' do
        @items.who_cost_id = ""
        @items.valid?
        expect(@items.errors.full_messages).to include("Who cost can't be blank")
      end

      it 'shipping_area_idが空では登録できない' do
        @items.shipping_area_id = ""
        @items.valid?
        expect(@items.errors.full_messages).to include("Shipping area can't be blank")
      end

      it 'days_to_ship_idが空では登録できない' do
        @items.days_to_ship_id = ""
        @items.valid?
        expect(@items.errors.full_messages).to include("Days to ship can't be blank")
      end

      it 'priceが空では登録できない' do
        @items.price = ""
        @items.valid?
        expect(@items.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300以上でないと登録できない' do
        @items.price = 299
        @items.valid?
        expect(@items.errors.full_messages).to include("Price is not included in the list")
      end

      it 'priceが10000000以上だと登録できない' do
        @items.price = 10000000
        @items.valid?
        expect(@items.errors.full_messages).to include("Price is not included in the list")
      end

      it 'priceが全角数字だと登録できない' do
        @items.price = "３００"
        @items.valid?
        expect(@items.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end
