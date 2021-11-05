require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @like = FactoryBot.build(:like)
  end

  describe 'イイね機能' do
    context 'イイねできる場合' do
      it 'user、goalが存在すればいいね機能を使える' do
        expect(@like).to be_valid
      end
    end
    context 'イイねできない場合' do
      it 'userが紐付いていないとイイね機能を使うことができない' do
        @like.user = nil
        @like.valid?
        expect(@like.errors.full_messages).to include('ユーザーを入力してください')
      end
      it 'goalが紐付いていないとイイね機能を使うことができない' do
        @like.goal = nil
        @like.valid?
        expect(@like.errors.full_messages).to include('目標を入力してください')
      end
    end
  end
end
