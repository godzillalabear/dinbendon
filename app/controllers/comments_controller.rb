class CommentsController < ApplicationController

  def create
      # @comment = Comment.new(comment_params, 
      #                         item_id: params[:item_id], 
      #                         user_id: current_user.id)

      # @comment.item_id = params[:item_id]
      # @comment.user_id = current_user.id

      @item = Item.find(params[:item_id])
      @comment = @item.comments.build(comment_params.merge(user: current_user))

      # @comment = @item.comments.build(comment_params, users: current_user)
      # error: build only allows 0 or 1 argument

      # @comment = current_user.comments.build(comment_params)
      # @comment.item = @item
      # solution 1 write it outside

      # @comment = current_user.comments.build(comment_params.merge(item: @item))
      #solution 2 using merge
      
      if @comment.save
        # redirect_to item_path(params[:item_id]), notice: 'Add new comment!'
      else
        render 'items/show'
        # notice: 'Fail to add new comment!'
      end
      
  end


  private
  def comment_params
    params.require(:comment).permit(:content)
    # params.require(:comment).permit(:content).merge(user: current_user)
  end
end
