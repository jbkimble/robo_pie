class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::NumberHelper
  helper_method :number_to_currency

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You now have #{pluralize(@cart.count_of(item.id), item.title)} in your Cart"
    redirect_to items_path
  end

  def show
    @items = get_items(@cart.contents)
    @total = totalize(@cart.contents)
  end
end
