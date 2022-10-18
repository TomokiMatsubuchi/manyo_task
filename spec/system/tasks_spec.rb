require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  describe '登録機能' do
    context 'タスクを登録した場合' do
      it '登録したタスクが表示される' do
        FactoryBot.create(:task)
        visit tasks_path
        expect(page).to have_content '書類作成'
      end
    end
  end

  describe '一覧表示機能' do
    let!(:first_task) {FactoryBot.create(:first_task)}
    let!(:second_task) {FactoryBot.create(:second_task)}
    let!(:third_task) {FactoryBot.create(:third_task)}
    before do
      Task.order("created_at DESC")
    end
    context '一覧画面に遷移した場合' do
      it '登録済みのタスク一覧が作成日時の降順で表示される' do
        Task.order("created_at DESC")
        visit tasks_path
        task_list = first('tbody tr')
        expect(page).to have_content 'first_task'
      end
    end

    context '新たにタスクを作成した場合' do
      it '新しいタスクが一番上に表示される' do
        Task.order("created_at DESC")
        visit tasks_path
        expect(page).to have_content 'first_task'
      end
    end
  end

  describe '詳細表示機能' do
    context '任意のタスク詳細画面に遷移した場合' do
      it 'そのタスクの内容が表示される' do
        task = FactoryBot.create(:task)
        visit task_path(task.id)
        expect(page).to have_content '書類作成'
      end
    end
  end

  
end