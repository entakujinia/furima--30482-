require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation,first_nameとlast_name,first_name_kanaとlast_name_kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

      it"nicknameがない場合は登録できないこと" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      
      it "emailがない場合は登録できないこと" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordがない場合は登録できないこと" do
        @user.password = ""
        @user.valid?       
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "password_confirmationがない場合は登録できないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password confirmation doesn't match Password")
      end

      it "first_nameがない場合は登録できないこと" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end

      it "first_name_kanaがない場合は登録できないこと" do
        @user.first_name_kana = ""
        @user.valid?       
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
      end

      it "last_nameがない場合は登録できないこと" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
      end

      it "last_name_kanaがない場合は登録できないこと" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid")
      end

      it "birthdayがない場合は登録できないこと" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "00qq0"
        @user.password_confirmation = "00qq0"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)", "Password is too short (minimum is 6 characters)")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "passwordが存在してもencrypted_passwordがない場合は登録できないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password confirmation doesn't match Password")
      end

      it 'first_nameが全角入力でなければ登録できないこと' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end

      it 'last_nameが全角入力でなければ登録できないこと' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
      end

      it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
      end

      it 'last_name_kanaが全角カタカナでなければ登録できないこと' do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid")
      end
  end
end


