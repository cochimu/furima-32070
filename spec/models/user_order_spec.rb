require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @user_order = FactoryBot.build(:user_order, user_id: user.id, item_id: item.id)
    end

    context '商品の購入ができる時' do
      it '全ての項目が正しく入力されていれば購入できること' do
        expect(@user_order).to be_valid
      end
    end

    context '商品の購入ができない時' do
      it 'tokenが空では登録できないこと' do
        @user_order.token = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_codeが空だと購入できないこと' do
        @user_order.post_code = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeにハイフンがないと登録できないこと' do
        @user_order.post_code = '1234567'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが空だと登録できないこと' do
        @user_order.prefecture_id = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが1だと登録できないこと' do
        @user_order.prefecture_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと登録できないこと' do
        @user_order.city = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと登録できないこと' do
        @user_order.address = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと登録できないこと' do
        @user_order.phone_number = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberにハイフンがあると登録できないこと' do
        @user_order.phone_number = '123-1234-5678'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberは11桁以内であること' do
        @user_order.phone_number = '123123456789'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
