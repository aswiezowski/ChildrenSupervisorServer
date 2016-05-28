class RaterController < ApplicationController

  def create
    if parent_signed_in?
      obj = params[:klass].classify.constantize.find(params[:id])
      obj.rate params[:score].to_f, current_parent, params[:dimension]

      update_task

      render :json => true
    else
      render :json => false
    end
  end

  private

  def update_task
    task = Task.find(params[:id])
    task.mark = params[:score].to_f
    task.status = true
    task.save
  end
end
