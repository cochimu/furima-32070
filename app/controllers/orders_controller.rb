class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :fraud_prevention, only: [:index]

  def index
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      Payjp.api_key = "sk_test_0d30d59d9a034132a22fafc2"
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
      @user_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id, order_id: params[:order_id])
  end
    
  def set_item
    @item = Item.find(params[:item_id])
  end

  def fraud_prevention
    redirect_to root_path if Item.find(params[:item_id]).user.id == current_user.id
  end
end
