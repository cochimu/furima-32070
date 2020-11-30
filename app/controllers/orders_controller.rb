class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      @user_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

    def order_params
      params.require(:user_order).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id)
    end

    def set_item
      @item = Item.find(params[:item_id])
    end
end