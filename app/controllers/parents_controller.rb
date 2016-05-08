class ParentsController < ApplicationController
  before_action :authenticate_parent!

  def show
    @children = Parent.find(params[:id]).children
  end
end
