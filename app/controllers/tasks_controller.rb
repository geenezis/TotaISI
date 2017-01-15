class TasksController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @users = @project.users
    @task = Task.new
  end

  def create
    @project = Project.find(params[:project_id])
    @users = @project.users
    @task = @project.tasks.build(task_params)
    if @task.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @users = @project.users
    @task = Task.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @users = @project.users
    @task = Task.find(params[:id])
   
    if @task.update(task_params)
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to :back
  end

  def show
  end

  private
    def task_params
      params.require(:task).permit(:title, :description, :estimation, :priority, :status, :user_id)
    end
end
