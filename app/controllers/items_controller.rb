class ItemsController < ApplicationController
  def index
    @items = Item.order("id DESC").includes(:user)
  end

  def new
    unless user_signed_in?
      redirect_to new_user_session_path 
    end
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    if user_signed_in? && current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :text, :category_id, :state_id, :burden_id, :prefecture_id, :day_id, :charge).merge(user_id: current_user.id)
  end
end
