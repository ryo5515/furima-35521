require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_destination = FactoryBot.build(:purchase_destination, user_id: @user.id, item_id: @item.id)
    sleep (0.5)
  end
  describe '商品購入' do
    context '商品購入が出来るとき' do
      it "postal_codeとarea_id,municipality,address,phone_numberがあれば購入できる" do
        expect(@purchase_destination).to be_valid
      end
      it "tokenがあれば購入できる" do
        expect(@purchase_destination).to be_valid
      end
      it "building_nameが空でも登録できる" do
        @purchase_destination.building_name = ""
        @purchase_destination.valid?
        expect(@purchase_destination).to be_valid
      end
    end

    context '商品購入が出来ないとき' do
      it "紐づくuserがいないと購入出来ない" do
        @purchase_destination.user_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("User can't be blank")
      end
      it "紐づくitemがないと購入出来ない" do
        @purchase_destination.item_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenがないと購入できない" do
        @purchase_destination.token = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeが空だと購入出来ない" do
        @purchase_destination.postal_code = ""
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeにハイフンがないと購入出来ない" do
        @purchase_destination.postal_code = "1234567"
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Postal code Input correctly")
      end
      it "area_idが未選択だと購入出来ない" do
        @purchase_destination.area_id = 1
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Area Select")
      end
      it "municipalityが空だと購入出来ない" do
        @purchase_destination.municipality =""
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Municipality can't be blank")
      end
      it "addressが空だと購入出来ない" do
        @purchase_destination.address = ""
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空だと購入出来ない" do
        @purchase_destination.phone_number = ""
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberに数値以外があると購入出来ない" do
        @purchase_destination.phone_number = "090-1234-5678"
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number Input only number")
      end
      it "phone_numberに英字があると購入できない" do
        @purchase_destination.phone_number = "num12345678"
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number Input only number")
      end
      it "phone_nimberが11桁以内でないと購入できない" do
        @purchase_destination.phone_number = "090123456789"
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number Input only number")
      end
    end
  end
end