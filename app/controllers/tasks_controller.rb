class TasksController < ApplicationController
  before_action :find_child

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = @child.tasks.build
  end

  def create
    @task = @child.tasks.build(task_params)
    @task.status = false

    if @task.save
      flash[:success] = "Your task has been added!"
      redirect_to parent_child_path(@child.parent.id, @child.id)
    else
      flash.now[:alert] = "Your task couldn't be added! Please check the form"
      render :new
    end
  end

  private
  def find_child
    @child = Child.find(params[:child_id])
  end

  def task_params
    params.require(:task).permit(:summary, :description, :mark)
  end
end
