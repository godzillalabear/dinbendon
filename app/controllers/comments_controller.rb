class CommentsController < ApplicationController

  def create
      redirect_to root_path, notice: 'Add new comment!'
  end
end
