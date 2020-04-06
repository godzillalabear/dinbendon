class ItemsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, 
              with: :record_not_found

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

  def record_not_found
    render file: 'public/404.html', 
           status: 404, 
           layout: false
  end
end
