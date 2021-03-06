class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_cart

  helper_method :current_user, :logged_in?

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def get_items(contents)
    contents.reduce({}) do |result, (id, quantity)|
      result[Item.find(id.to_i)] = quantity
      result
    end
  end

  def totalize(contents)
    contents.reduce(0) do |total, (id, quantity)|
      total += Item.find(id.to_i).price * quantity
      total
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user
  end

  def current_admin?
    current_user && current_user.admin?
  end
end
