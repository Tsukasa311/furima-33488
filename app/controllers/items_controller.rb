class ItemsController < ApplicationController
  before_action :set_item , only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @items = Item.order("id DESC").includes(:user)
  end

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

  def show
  end

  def edit
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :title, :text, :category_id, :state_id, :burden_id, :prefecture_id, :day_id, :charge).merge(user_id: current_user.id)
  end
end
