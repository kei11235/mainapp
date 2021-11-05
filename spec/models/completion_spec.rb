require 'rails_helper'

RSpec.describe Completion, type: :model do
  before do
    @completion = FactoryBot.build(:completion)
  end

  describe 'タスク機能' do
    context 'タスクが投稿できる場合' do
      it 'content、user、goalが存在すればタスクが投稿できる' do
        expect(@completion).to be_valid
      end
    end
    context 'タスクが投稿ができない場合' do
      it 'contentが空ではタスク投稿できない' do
        @completion.content = ''
        @completion.valid?
        expect(@completion.errors.full_messages).to include('タスクを入力してください')
      end
      it 'goalが紐付いていないとタスク投稿できない' do
        @completion.goal = nil
        @completion.valid?
        expect(@completion.errors.full_messages).to include('目標を入力してください')
      end
    end
  end
end
