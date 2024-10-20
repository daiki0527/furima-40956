class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create]
  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
  end

  private

  def order_params
    params.require(:order_form).permit(:postal_code, :area_id, :city, :address, :building, :telephone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end
end
