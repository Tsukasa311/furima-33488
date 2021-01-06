class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title,:text,:category_id, :state_id, :burden_id, :prefecture_id, :day_id, :charge).merge(id: current_user.id)
end
