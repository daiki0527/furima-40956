class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create]
  before_action :authenticate_user!
  def index
    @order_form = OrderForm.new
    return redirect_to root_path if current_user.id == @item.user_id || !@item.order.nil?

    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
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

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
