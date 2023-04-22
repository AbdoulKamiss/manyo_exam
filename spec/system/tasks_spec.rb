require 'rails_helper'

RSpec.describe 'Task management function', type: :system do

    let!(:first_task) { FactoryBot.create(:task, title: 'first_task', deadline_on: '2025-02-18', priority: 'medium', status: 'todo')  }
    let!(:second_task) { FactoryBot.create(:task, title: 'second_task', deadline_on: '2025-02-17', priority: 'high', status: 'doing') }
    let!(:third_task) { FactoryBot.create(:task, title: 'third_task', deadline_on: '2025-02-16', priority: 'low', status: 'done') }

  describe 'Registration function' do
    context 'When registering a task' do
      it 'The registered task is displayed' do
        FactoryBot.create(:task)
        visit @task
        expect(page).to have_content 'Préparation des documents'
      end
    end
  end

  describe 'List display function' do

    before do
      visit tasks_path
    end

    context 'When transitioning to the list screen' do
      it 'The list of created tasks is displayed in descending order of creation date and time.' do
        task_list = all('tbody tr')
      end
    end
    context 'When creating a new task' do
      let!(:new_task) { FactoryBot.create(:task, title: 'new_task_title', created_at: '2025-02-19', deadline_on: '2025-02-20', priority: :medium, status: :todo) }

      before do
        visit tasks_path
      end
      it 'New task is displayed at the top' do
        task_list = all('tbody tr')
        expect(task_list[0]).to have_content('new_task_title')
      end
    end
  end

  describe 'Detailed display function' do
     context 'When transitioned to any task details screen' do
       it 'The content of the task is displayed' do
        FactoryBot.create(:task)
        visit @task
        expect(page).to have_content 'Créer une proposition.'
       end
     end
  end
  describe 'Sorting function' do
     context 'If you click on the link of deadline' do
       it 'A list of tasks sorted in ascending order of due date is displayed' do
         # Utilisez la méthode all pour vérifier l'ordre de plusieurs données de test.
       end
     end
     context 'If you click on the link of priority' do
       it 'A list of tasks sorted by priority is displayed' do
         # Utilisez la méthode all pour vérifier l'ordre de plusieurs données de test.
       end
     end
   end
   describe 'Search function' do
     context 'If you perform a fuzzy search by Title' do
       it 'Only tasks that contain search terms are displayed.' do
         # Utilisez les matrices to et not_to pour vérifier à la fois ce qui est affiché et ce qui ne l'est pas.
       end
     end
     context 'Search by status' do
       it 'Status matches' do
         # Utilisez les matrices to et not_to pour vérifier à la fois ce qui est affiché et ce qui ne l'est pas.
       end
     end
     context 'Title and search by status' do
       it 'Only tasks that contain the search word Title and match the status will be displayed' do
         # Utilisez les matrices to et not_to pour vérifier à la fois ce qui est affiché et ce qui ne l'est pas.
       end
     end
   end
end