class Admin::DashboardController < Admin::BaseController
  before_action :require_admin

  def index
    @orders = Order.all
  end

  def show
    @admin = User.find(params[:id])
    render file: '/public/404' unless @admin == current_user
  end

end
