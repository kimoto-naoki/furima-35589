class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.create(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @items = Item.find(params[:id])
  end

  def edit
    if current_user.id != Item.find(params[:id]).user_id
      redirect_to root_path
    end
    @items = Item.find(params[:id])
  end

  def update
    @items = Item.find(params[:id])
    if @items.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end
  private
  def item_params
    params.require(:item).permit(
      :item_name, :item_text, :category_id, :condition_id, :who_cost_id,
      :shipping_area_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end
