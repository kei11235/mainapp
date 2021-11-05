require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント機能' do
    context 'コメントできる場合' do
      it 'text、user、goalが存在すればいいね機能を使える' do
        expect(@comment).to be_valid
      end
    end
    context 'コメントできない場合' do
      it 'textが空ではコメントできない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include('コメントを入力してください')
      end
      it 'userが紐付いていないとイイね機能を使うことができない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('ユーザーを入力してください')
      end
      it 'goalが紐付いていないとイイね機能を使うことができない' do
        @comment.goal = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('目標を入力してください')
      end
    end
  end
end
