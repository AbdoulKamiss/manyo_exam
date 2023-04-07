class TasksController < ApplicationController
    before_action :set_task, only: %i[ show edit update destroy ]

    def index
        @tasks = Task.all 
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        if @task.save
          redirect_to tasks_url, notice: "Task was succesfully created."
        else
          render :new
        end
    end

    def show
    end
    
    def edit
    end

    def update
        if @task.update(task_params)
          redirect_to @task, notice: "Task was succesfully updated."
        else
          render :edit
        end
    end
    
    def destroy
        @task.destroy
        redirect_to tasks_url, notice: "Task was succesfully destroyed."
    end

    private
        def set_task
            @task = Task.find(params[:id])
        end
        def task_params
            params.require(:task).permit(:title, :content)
        end
end
