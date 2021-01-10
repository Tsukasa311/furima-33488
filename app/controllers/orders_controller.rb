class OrdersController < ApplicationController
  before_action :set_order_item, only: [:index, :create]

  def index
    @order_item = OrderItem.new
  end

  def create
    @order_item = OrderItem.new(order_item_params)
    if @order_item.valid?
      @order_item.save
      redirect_to root_path
    else 
      render :index
    end
  end

  private

  def set_order_item
    @item = Item.find(params[:item_id])
  end

  def order_item_params
    params.require(:order_item).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
