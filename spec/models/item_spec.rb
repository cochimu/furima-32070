require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品の出品ができる時' do
      it '全ての項目が存在すれば登録できること' do
      end
    end

    context '商品の出品ができない時' do
      it '商品画像がないと登録できないこと' do
      end

      it '商品名がないと登録できないこと' do
      end

      it '商品の説明がないと登録できないこと' do
      end

      it 'カテゴリーの情報がないと登録できないこと' do
      end

      it '商品の状態についての情報がないと登録できないこと' do
      end

      it '配送料の負担についての情報がないと登録できないこと' do
      end

      it '発送元の地域の情報がないと登録できないこと' do
      end

      it '発送までの日数の情報がないと登録できないこと' do
      end

      it '価格の入力がないと登録できないこと' do
      end

      it '価格の範囲が¥300~¥9999999でないと登録できないこと' do
      end

      it '価格は半角数字でないと登録できないこと' do
      end
    end
  end
end
