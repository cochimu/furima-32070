class ItemsController < ApplicationController
  def index
    # @items = Item.all
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

  private

  def item_params
    params.require(:item).permit(:name, :price, :introduction, :image, :category_id, :charge_id, :day_id, :prefecture_id, :status_id).merge(user_id: current_user.id)
  end
end
