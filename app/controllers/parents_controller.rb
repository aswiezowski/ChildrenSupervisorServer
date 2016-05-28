class ParentsController < ApplicationController
  #before_filter :check_parent, only: :show
  before_action :find_parent
  before_action :authenticate_parent!

  def show
    @children = @parent.children

    respond_to do |format|
      format.json { render json: @parent }
      format.html # show.html.erb
    end
  end

  private

  def check_parent
    unless current_parent.parent_name.downcase == params[:id].to_s
      flash[:alert] = "That account doesn't belong to you!"
      redirect_to root_path
    end
  end

  def find_parent
    @parent = Parent.find(params[:id])
  end
end
