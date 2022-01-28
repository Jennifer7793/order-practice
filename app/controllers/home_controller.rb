class HomeController < ActionController::Base
  def index
    @orders = Order.all
    @third = ThirdPartyPayment.all
  end
end