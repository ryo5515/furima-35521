require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品情報入力' do
    context '商品出品が出来るとき' do
      it "product_nameとdescription,category_id,status_id,burden_id,area_id,day_delivery_id,price,imageがあれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品が出来ないとき' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "product_nameが空だと登録できない" do
        @item.product_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it "descriptionが空だと登録できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "category_idが未選択だと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category を選択してください")
      end
      it "status_idが未選択だと登録できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status を選択してください")
      end
      it "burden_idが未選択だと登録できない" do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden を選択してください")
      end
      it "area_idが未選択だと登録できない" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area を選択してください")
      end
      it "day_deliveryが未選択だと登録できない" do
        @item.day_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day delivery を選択してください")
      end
      it "priceが空だと登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが300未満だと登録できない" do
        @item.price = 10
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが9,999,999を超えると登録できない" do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが全角数字だと登録できない" do
        @item.price = "１２３４５"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list", "Price is not a number")
      end
    end
  end
end
