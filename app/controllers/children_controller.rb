class ChildrenController < ApplicationController

  def new
    @child = current_parent.children.build
  end

  def create
    @child = current_parent.children.build(child_params)

    if @child.save
      flash[:success] = "Your child has been added!"
      redirect_to root_path
    else
      flash.now[:alert] = "Your child couldn't be added! Please check the form"
      render :new
    end
  end

  private

  def child_params
    params.require(:child).permit(:name, :age)
  end
end
