require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'email、password、password_confirmation、nickname、age_id、sex_id、profession_idが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'effortが空でも登録できる' do
        @user.effort = ''
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it '重複したemailは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスは不正な値です')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordは5文字以下では登録できない' do
        @user.password = 'a1234'
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordは英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは英字と数字の両方を含めて入力してください')
      end
      it 'passwordは数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは英字と数字の両方を含めて入力してください')
      end
      it 'passwordは半角でないと登録できない' do
        @user.password = 'S１２３４５６'
        @user.password_confirmation = 'S１２３４５６'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは英字と数字の両方を含めて入力してください')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'b12345'
        @user.password_confirmation = 'a12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'age_idの値が1（ユーザーが選択していない状態）では出品できない' do
        @user.age_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('年齢を選択して下さい')
      end
      it 'sex_idの値が1（ユーザーが選択していない状態）では出品できない' do
        @user.sex_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('性別を選択して下さい')
      end
      it 'profession_idの値が1（ユーザーが選択していない状態）では出品できない' do
        @user.profession_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('お仕事を選択して下さい')
      end
    end
  end
end
