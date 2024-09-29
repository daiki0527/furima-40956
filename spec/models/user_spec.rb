require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemailとencrypted_passwordとlast_nameとfirst_nameとlast_name_kanaとfirst_name_kanaとbirthが存在すれば登録できる' do
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
      end
      it 'emailが空では登録できない' do
      end
      it 'encrypted_passwordが空では登録できない' do
      end
      it 'confirmation_passwordとencrypted_passwordが不一致では登録できない' do
      end
      it 'nicknameが6文字以上では登録できない' do
      end
      it '重複したemailが存在する場合は登録できない' do
      end
      it 'emailは@を含まないと登録できない' do
      end
      it 'encrypted_passwordが5文字以下では登録できない' do
      end
      it 'encrypted_passwordが129文字以上では登録できない' do
      end
      it 'last_nameが空では登録できない' do
      end
      it 'first_nameが空では登録できない' do
      end
      it 'last_name_kanaが空では登録できない' do
      end
      it 'first_name_kanaが空では登録できない' do
      end
      it 'birthが空では登録できない' do
      end
    end
  end
end
