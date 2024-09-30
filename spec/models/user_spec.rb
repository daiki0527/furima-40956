require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemailとpasswordとconfirmation_passwordとfirst_nameとlast_nameとfirst_name_kanaとlast_name_kanaとbirthが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'confirmation_passwordとpasswordが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123457'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'birthが空では登録できない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
      it 'passwordに半角英字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'last_nameは半角入力では登録できない' do
        @user.last_name = 'ｙａｍａｄａ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
      end
      it 'first_nameはは半角入力では登録できない' do
        @user.first_name = 'ｔａｒｏ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end
      it 'last_name_kanaはひらがな入力では登録できない' do
        @user.last_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana はカタカナで入力してください')
      end
      it 'first_name_kanaはひらがな入力では登録できない' do
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana はカタカナで入力してください')
      end
      it 'passwordに数字だけでは登録できない' do
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'ｙamada0527'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字のみで入力してください')
      end
    end
  end
end
