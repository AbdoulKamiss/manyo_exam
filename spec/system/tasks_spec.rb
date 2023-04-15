require 'rails_helper'

RSpec.describe 'Task management function', type: :system do
  describe 'Registration function' do
    context 'When you register a task' do
      before do
        visit new_task_path
        fill_in 'タイトル', with: 'first_task'
        fill_in '内容', with: 'Prepare a proposal.'
        click_button '登録する'
      end

      it 'Registered tasks are displayed' do
        expect(page).to have_content('first_task')
      end
    end
  end

  describe 'List display function' do
    let!(:first_task) { FactoryBot.create(:task, created_at: '2025-02-18') }
    let!(:second_task) { FactoryBot.create(:task, created_at: '2025-02-17') }
    let!(:third_task) { FactoryBot.create(:task, created_at: '2025-02-16') }
  
    before do
      visit tasks_path
    end
  
    context 'When moving to the list screen' do
      it 'The list of created tasks is displayed in descending order of creation date and time' do
        task_list = all('tbody tr')
  
        expect(task_list[0]).to have_content first_task.title
        expect(task_list[1]).to have_content second_task.title
        expect(task_list[2]).to have_content third_task.title
      end
    end

    context 'When a new task is created' do
      let!(:new_task) { FactoryBot.create(:task, title: 'new_task_title', created_at: '2025-02-15') }

      before do
        visit tasks_path
      end

      it 'New tasks appear at the top of the list' do
        expect(page).to have_content('new_task_title')
        expect(page).to have_content(new_task.created_at.strftime('%Y/%m/%d'))
      end
    end
  end

  describe 'Detail display function' do
    context 'When transitioning to any task detail screen' do
      before do
        FactoryBot.create(:task, content: 'first_task')
        visit tasks_path
        click_on '詳細'
      end

      it 'The contents of that task are displayed' do
        expect(page).to have_content 'first_task'
      end
    end
  end
end