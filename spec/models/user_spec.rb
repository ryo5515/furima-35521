require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録が上手くいく時' do
      it "nicknameとemail、passwordとpassword_confiramation,last_name,first_name,last_name_kana,first_name_kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが６文字以上の半角英数字混合であれば登録できる" do
        @user.password = "000aaa"
        @user.password_confirmation = "000aaa"
        expect(@user).to be_valid
      end
      it "last_nameが全角文字であれば登録できる" do
        @user.last_name = "山田"
        expect(@user).to be_valid
      end
      it "first_nameが全角文字であれば登録できる" do
        @user.first_name = "太郎"
        expect(@user).to be_valid
      end
      it "last_name_kanaが全角カナであれば登録できる" do
        @user.last_name_kana = "ヤマダ"
        expect(@user).to be_valid
      end
      it "first_name_kanaが全角カナであれば登録できる" do
        @user.first_name_kana = "タロウ"
        expect(@user).to be_valid
      end
    end

    context '新規登録が上手くいかない時' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include ("ニックネームを入力してください")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include ("Eメールを入力してください")
      end
      it "emailに@を含んでいないと登録できない" do
        @user.email = "aaagmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Eメールは不正な値です")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include ("Eメールはすでに存在します")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include ("パスワードを入力してください")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00aaa"
        @user.password_confirmation = "000aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include ("パスワードは6文字以上で入力してください")
      end
      
      it "passwordが半角英語だけでは登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include ("パスワードは半角英数字混合で設定してください")
      end
      it "passwordが全角英数混合だと登録できない" do
        @user.password = "ｄｓｚ１２３"
        @user.valid?
        expect(@user.errors.full_messages).to include ("パスワードは半角英数字混合で設定してください")
      end
      it "passwordは半角数字のみでは登録できない" do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include ("パスワードは半角英数字混合で設定してください")
      end
      it "passwordとpassword_confirmationが一致しない場合登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include ("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include ("名字を入力してください")
      end
      it "last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.last_name = "ｱｱｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include ("名字には全角文字を使用してください")
      end
      it "last_name_kanaが全角（カタカナ）でないと登録できない" do
        @user.last_name_kana = "あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include ("名字(カナ)には全角カタカナを使用してください")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include ("名前を入力してください")
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.first_name = "ｱｱｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include ("名前には全角文字を使用してください")
      end
      it "first_name_kanaが全角（カタカナ）でないと登録できない" do
        @user.first_name_kana = "あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include ("名前(カナ)には全角カタカナを使用してください")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include ("生年月日を入力してください")
      end

    end
  end
end