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
        expect(@item.errors.full_messages).to include("商品画像を入力してください")
      end
      it "product_nameが空だと登録できない" do
        @item.product_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it "descriptionが空だと登録できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it "category_idが未選択だと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it "status_idが未選択だと登録できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
      it "burden_idが未選択だと登録できない" do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it "area_idが未選択だと登録できない" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end
      it "day_deliveryが未選択だと登録できない" do
        @item.day_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end
      it "priceが空だと登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it "priceが300未満だと登録できない" do
        @item.price = 10
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は一覧にありません")
      end
      it "priceが9,999,999を超えると登録できない" do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は一覧にありません")
      end
      it "priceが全角数字だと登録できない" do
        @item.price = "１２３４５"
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は一覧にありません", "価格は数値で入力してください")
      end
      it "priceが半角英数混合では登録できない" do
        @item.price = "12a34"
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は一覧にありません", "価格は数値で入力してください")
      end
      it "priceが半角英語だけでは登録できない" do
        @item.price = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は一覧にありません", "価格は数値で入力してください")
      end
    end
  end
end
