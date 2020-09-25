class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, except: [:create]

  def create
    @task = @project.tasks.create(task_params)
    redirect_to @project
  end

  def destroy
    @task = @project.tasks.find(params[:id])
    if @task.destroy
      flash[:success] = "Project task was deleted."
    else
      flash[:error] = "Project task could not be deleted."
    end
    redirect_to @project 
  end

  def complete
    @task = Task.find params[:id]
    @task.complete!
    redirect_to @project, notice: "Task completed"
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit([:name, :status])
  end
end
