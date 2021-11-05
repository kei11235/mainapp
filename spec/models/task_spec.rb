require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    @task = FactoryBot.build(:task)
  end

  describe 'タスク機能' do
    context 'タスクが投稿できる場合' do
      it 'content、user、goalが存在すればタスクが投稿できる' do
        expect(@task).to be_valid
      end
    end
    context 'タスクが投稿ができない場合' do
      it 'contentが空ではタスク投稿できない' do
        @task.content = ''
        @task.valid?
        expect(@task.errors.full_messages).to include('タスクを入力してください')
      end
      it 'goalが紐付いていないとタスク投稿できない' do
        @task.goal = nil
        @task.valid?
        expect(@task.errors.full_messages).to include('目標を入力してください')
      end
    end
  end
end
