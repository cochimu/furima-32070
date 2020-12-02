class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit]
  before_action :barrier_user, only: [:edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_order, only: [:show, :edit]

  def index
    @items = Item.all.order(created_at: :DESC)
    @orders = Order.all
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path if @item.id == @order.item_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :introduction, :image, :category_id, :charge_id, :day_id, :prefecture_id, :status_id).merge(user_id: current_user.id)
  end

  def barrier_user
    redirect_to root_path unless Item.find(params[:id]).user.id == current_user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_order
    @order = Order.find_by(params[:item_id])
  end
end
