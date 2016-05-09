class ParentsController < ApplicationController
  before_filter :check_parent, only: :show
  before_action :authenticate_parent!

  def show
    @children = Parent.find(params[:id]).children
  end

  private

  def check_parent
    unless current_parent.id == params[:id].to_i
      flash[:alert] = "That account doesn't belong to you!"
      redirect_to root_path
    end
  end
end
