require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @items = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品を出品できる場合' do
      it 'userとimageとnameとexplanationとpriceとcategory_idとcondition_idとcharge_idとarea_idとdelivery_day_idが存在すれば登録できる' do
        expect(@items).to be_valid
      end
    end
    context '商品が出品できないとき' do
      it '画像が空だと出品できない' do
        @items.image = nil
        @items.valid?
        expect(@items.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では出品できない' do
        @items.name = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Name can't be blank")
      end

      it '説明が空だと出品できない' do
        @items.explanation = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'カテゴリーが空だと出品できない' do
        @items.category_id = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Category can't be blank")
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @items.category_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include("Category can't be blank")
      end
      it '状態が空だと出品できない' do
        @items.condition_id = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Condition can't be blank")
      end

      it '状態に「---」が選択されている場合は出品できない' do
        @items.charge_id = '1'
        @items.valid?
        expect(@items.errors.full_messages).to include("Charge can't be blank")
      end

      it '配送料負担が空だと出品できない' do
        @items.charge_id = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Charge can't be blank")
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @items.charge_id = '1'
        @items.valid?
        expect(@items.errors.full_messages).to include("Charge can't be blank")
      end
      it '発送元が空だと出品できない' do
        @items.area_id = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Area can't be blank")
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @items.area_id = '1'
        @items.valid?
        expect(@items.errors.full_messages).to include("Area can't be blank")
      end

      it '発送日までの日数が空だと出品できない' do
        @items.delivery_day_id = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Delivery day can't be blank")
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @items.delivery_day_id = '1'
        @items.valid?
        expect(@items.errors.full_messages).to include("Delivery day can't be blank")
      end

      it '価格が空だと出品できない' do
        @items.price = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Price is not a number")
      end

      it '価格は全角文字が含まれると出品できない' do
        @items.price = '５００'
        @items.valid?
        expect(@items.errors.full_messages).to include('Price is not a number')
      end
      it '価格は300円以上でないと出品できない' do
        @items.price = '299'
        @items.valid?

        expect(@items.errors.full_messages).to include('Price must be greater than 299')
      end

      it '価格は9,999,999円以下でないと出品できない' do
        @items.price = '10_000_000'
        @items.valid?

        expect(@items.errors.full_messages).to include('Price must be an integer')
      end

      it 'userが紐付いていなければ出品できない' do
        @items.user = nil
        @items.valid?

        expect(@items.errors.full_messages).to include('User must exist')
      end
    end
  end
end
