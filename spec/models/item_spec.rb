require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録機能' do

    context '商品登録できるとき' do
      it '全ての項目で空がないとき' do
        expect(@item).to be_valid
      end
    end

    context '商品登録できないとき' do
      it '出品画像が空のとき' do
        @item.image = nil 
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'タイトルが空のとき' do
        @item.title = nil 
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '商品の説明が空のとき' do
        @item.text = nil 
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it '金額が空のとき' do
        @item.charge = nil 
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it '金額が299円以下のとき' do
        @item.charge = '297'
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge must be greater than 299")
      end
      it '金額が10,000,000円以上のとき' do
        @item.charge = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge must be less than 10000000")
      end
      it 'カテゴリーで「--」が選択されたとき' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品の状態で「--」が選択されたとき' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end
      it '発送料の負担で「--」が選択されたとき' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden must be other than 1")
      end
      it '発送元の地域で「--」が選択されたとき' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '発送までの日数で「--」が選択されたとき' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
      end
      it 'カテゴリーが空のとき' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it '商品の状態が空のとき' do
        @item.state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("State is not a number")
      end
      it '発送料の負担が空のとき' do
        @item.burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden is not a number")
      end
      it '発送元の地域が空のとき' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it '発送までの日数が空のとき' do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Day is not a number")
      end
    end
  end
end
