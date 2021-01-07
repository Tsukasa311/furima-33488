class ItemsController < ApplicationController
  def index
    @items = Item.order("id DESC").includes(:user)
  end

  def new
    redirect_to new_user_session_path unless user_signed_in?
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
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
    params.require(:item).permit(:image, :title, :text, :category_id, :state_id, :burden_id, :prefecture_id, :day_id,
                                 :charge).merge(user_id: current_user.id)
  end
end
