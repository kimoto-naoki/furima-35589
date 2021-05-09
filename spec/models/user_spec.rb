require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録機能' do    
    it '全ての項目の値が適切であれば登録できる' do
      expect(@user).to be_valid
    end

    it 'nicnameが空では登録できない' do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したemailが存在すれば登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'emailに@が含まれていなければ登録できない' do
      @user.email = "test.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'passwordが空では登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
  
    it 'passwordが5文字以下では登録できない' do
      @user.password = "111aa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordが半角英数混合でなければ登録できない' do
      @user.password = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'passwordとpassword_confirmationが一致していなければ登録できない' do
      @user.password="bbb222"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'last_nameが空では登録できない' do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.last_name = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.first_name = "tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it 'ruby_lasut_nameが空では登録できない' do
      @user.ruby_last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Ruby last name can't be blank")
    end

    it 'ruby_last_nameが全角（カタカナ）でなければ登録できない' do
      @user.ruby_last_name  = "ﾔﾏﾀﾞ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Ruby last name is invalid")
    end

    it 'ruby_first_nameが空では登録できない' do
      @user.ruby_first_name  = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Ruby first name can't be blank")
    end

    it 'ruby_first_nameが全角（カタカナ）でなければ登録出来ない' do
      @user.ruby_first_name  = "ﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Ruby first name is invalid")
    end

    it 'birthdayが空では登録出来ない' do
      @user.birthday  = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
