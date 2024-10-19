class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create]
  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
  end

  private

  def set_order
    @item = Item.find(params[:item_id])
  end
end
