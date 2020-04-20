class ItemsController < ApplicationController

  before_action :find_item, only: [:show, :edit, :update, :destroy]
                            # excepte:[ :index, :new, :create]

  def index
    @items = Item.all
  end

  def show
    # @item = Item.find(params[:id])
    @comment = Comment.new
    @comments = @item.comments.includes(:user) #eager loading

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to items_path, notice: 'Add new order!'
    else
      render :new
    end
  end

  def edit
    # find_item
    # @item = Item.find(params[:id])
  end

  def update
    #no need a page, just complete the action
    # find_item
    # @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to items_path, notice: 'Your order is updated!'
    else
      render :edit
    end
  end

  def destroy
    # find_item
    # @item.destroy
    @item.update(deleted_at: Time.now)

    redirect_to items_path, notice: 'Delete the order'
  end

  private
  def find_item
    @item = Item.find(params[:id])
    # @item = Item.find_by!(params[:id], deleted_at: nil)
  end
  def item_params
    #only permit these variable, no user can send other variable via browser
    params.require(:item).permit(:name, 
                                 :description, 
                                 :price, 
                                 :spec,
                                 :cover,
                                 :category_id)
  end

  
end
