class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  # def update
  # if @items.update(item_params)
  # redirect_to item_path
  # else
  # render :edit, status: :unprocessable_entity
  # end
  # end

  private

  def item_params
    params.require(:item).permit(:image, :name, :price, :explanation, :category_id, :condition_id, :charge_id, :area_id,
                                 :delivery_day_id).merge(user_id: current_user.id)
  end
end
