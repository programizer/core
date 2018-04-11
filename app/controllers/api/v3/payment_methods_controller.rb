class Api::V3::PaymentMethodsController < Api::BaseController

  before_action :require_auth

  def index
    @collection = current_user.payment_methods
    render 'api/v3/payment_methods/index'
  end
end
