class TasksController < ApplicationController
  before_action :find_child, only: [:new, :create]
  before_action :find_task, only: [:show, :edit, :update]

  def show
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

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task
    end
  end

  private

  def find_child
    @child = Child.find(params[:child_id])
  end

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:summary, :description, :mark)
  end
end
