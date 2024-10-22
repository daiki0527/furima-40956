require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '商品の購入' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @order_form = FactoryBot.build(:order_form, user_id: @user.id, item_id: [@item.id])
    end
    context '商品を購入できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end

      it 'buildingは空でも購入できること' do
        @order_form.building = ''
        expect(@order_form).to be_valid
      end
    end

    context '商品を購入できない場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと購入できない' do
        @order_form.postal_code = '1234567'
        @order_form.valid?

        expect(@order_form.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'areaを選択していないと購入できない' do
        @order_form.area_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Area can't be blank")
      end

      it 'cityが空だと購入できない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと購入できない' do
        @order_form.address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end

      it 'telephone_numberが空だと購入できない' do
        @order_form.telephone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが10文字未満なら購入できない' do
        @order_form.telephone_number = '123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Telephone number is invalid.')
      end
      it 'telephone_numberにハイフンが含まれると購入できない' do
        @order_form.telephone_number = '123-456-789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Telephone number is invalid.')
      end
      it 'telephone_numberは半角数字でないと購入できない' do
        @order_form.telephone_number = '１２３４５６７８９０'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Telephone number is invalid.')
      end
      it 'telephone_numberは12桁以上だと購入できない' do
        @order_form.telephone_number = '123456789012'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Telephone number is invalid.')
      end

      it 'userが紐づいていないと購入できない' do
        @order_form.user_id = nil
        @order_form.valid?

        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐づいていないと購入できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では購入できない' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
