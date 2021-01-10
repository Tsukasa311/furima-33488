require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  before do
    @order_item = FactoryBot.build(:order_item)
  end

  context "購入できるとき" do
   it "必須項目が全て入力されているとき" do
     expect(@order_item).to be_valid
   end
   it "buildingの項目が空のとき" do
     @order_item.building = nil
     expect(@order_item).to be_valid
   end
  end

  context "購入できないとき" do
    it "郵便番号にハイフン（-）が含まれていないとき" do
      @order_item.postcode = "3343334"
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
    end
    it "郵便番号が空のとき" do
      @order_item.postcode = nil
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("Postcode can't be blank")
    end
    it "都道府県が空のとき" do
      @order_item.prefecture_id = nil
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "都道府県において「ーー」を選択したとき" do
      @order_item.prefecture_id = 1
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it "市町村が空のとき" do
      @order_item.city = nil
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("City can't be blank")
    end
    it "番地が空のとき" do
      @order_item.block = nil
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("Block can't be blank")
    end
    it "電話番号が空のとき" do
      @order_item.phone_number = nil
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("Phone number can't be blank")
    end
    it "電話番号が全角のとき" do
      @order_item.phone_number = '０９０１２３４５６７８'
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("Phone number is invalid. Input half-width characters.") 
    end
    it "電話番号が11桁以上あるとき" do
      @order_item.phone_number = '090123456789'
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
    it "tokenが空のとき" do
      @order_item.token = nil
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("Token can't be blank")
    end
  end
end
