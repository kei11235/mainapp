require 'rails_helper'

RSpec.describe Goal, type: :model do
  before do
    @goal = FactoryBot.build(:goal)
  end

  describe '目標設定機能' do
    context '目標設定できる場合' do
      it 'target、time、userが存在すれば出品できる' do
        expect(@goal).to be_valid
      end
      it 'reasonが空でも登録できる' do
        @goal.reason = ''
        expect(@goal).to be_valid
      end
      it 'achievementが空でも登録できる' do
        @goal.achievement = ''
        expect(@goal).to be_valid
      end
      it 'likeが空でも登録できる' do
        @goal.like = ''
        expect(@goal).to be_valid
      end
    end
    context '目標設定できない場合' do
      it 'targetが空では登録できない' do
        @goal.target = ''
        @goal.valid?
        expect(@goal.errors.full_messages).to include("目標を入力してください")
      end
      it 'timeが空では登録できない' do
        @goal.time = ''
        @goal.valid?
        expect(@goal.errors.full_messages).to include("期日を入力してください")
      end
      it 'userが紐付いていないと登録できない' do
        @goal.user = nil
        @goal.valid?
        expect(@goal.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
    
  end
end

