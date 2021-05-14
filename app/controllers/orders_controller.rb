class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index  

    if @items.order.blank? && current_user.id != @items.user_id
      @order_address = OrderAddress.new
    else
       redirect_to root_path
    end
  end

  def create

    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else      
      render :index
    end
  end  

  private

  def set_item
    @items = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(
      :postal_code, :shipping_area_id, :city, :house_number, :phone_number ).merge(
        user_id: current_user.id, item_id: @items.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: @items.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end
end
