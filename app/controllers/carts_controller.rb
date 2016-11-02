class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper
  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You now have #{pluralize(@cart.count_of(item.id), item.title)} in your Cart"
    redirect_to items_path
  end

  def show
    @items = get_items(@cart.contents)
  end
end
