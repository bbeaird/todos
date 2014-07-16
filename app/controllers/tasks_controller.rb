class TasksController < ApplicationController
  before_action :set_project #only: [:new]

  def new
    @task = Task.new(:project => @project)
  end

  def create
    @task = @project.tasks.build(task_params)
    p params
    p task_params
    p @task
    @task.save
    head :ok
  end

  private
    def task_params
      params.require(:task).permit(:todo)
      # params[:task]
    end

    def set_project
      @project = Project.find(params[:project_id])
    end
end