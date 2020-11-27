require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品の出品ができる時' do
      it '全ての項目が存在すれば登録できること' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができない時' do
      it '商品画像がないと登録できないこと' do
      end

      it '商品名がないと登録できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明がないと登録できないこと' do
        @item.introduction = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end

      it 'カテゴリーの情報がないと登録できないこと' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end

      it '商品の状態についての情報がないと登録できないこと' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number")
      end

      it '配送料の負担についての情報がないと登録できないこと' do
        @item.charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge is not a number")
      end

      it '発送元の地域の情報がないと登録できないこと' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end

      it '発送までの日数の情報がないと登録できないこと' do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Day is not a number")
      end

      it '価格の入力がないと登録できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格の範囲が¥300以上でないと登録できないこと' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end

      it '価格の範囲が¥9999999以下でないと登録できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end

      it '価格は半角数字でないと登録できないこと' do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
