class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def show
  end

  def index
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      render "new"
    end
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:image)
  end

end
