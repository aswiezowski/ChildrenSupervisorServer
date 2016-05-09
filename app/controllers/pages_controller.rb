class PagesController < ApplicationController
  def main
    if parent_signed_in?
      redirect_to current_parent
    end
  end
end
