class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit]
  before_action :barrier_user, only: [:edit]

  def index
    @items = Item.all.order(created_at: :DESC)
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
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
    params.require(:item).permit(:name, :price, :introduction, :image, :category_id, :charge_id, :day_id, :prefecture_id, :status_id).merge(user_id: current_user.id)
  end

  def barrier_user
    redirect_to root_path unless Item.find(params[:id]).user.id == current_user.id
  end
end
