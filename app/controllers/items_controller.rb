class ItemsController < ApplicationController



  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
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
    @item = Item.find(params[:id])
  end

  def update
    #no need a page, just complete the action
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to items_path, notice: 'Your order is updated!'
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to items_path, notice: 'Delete the order'
  end

  private
  def item_params
    params.require(:item).permit(:name, 
                                 :description, 
                                 :price, 
                                 :spec)
  end

  
end
