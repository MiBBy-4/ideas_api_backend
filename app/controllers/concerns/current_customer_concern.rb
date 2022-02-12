module CurrentCustomerConcern
  extend ActiveSupport::Concern

  include do
    before_action :set_current_customer
  end

  def set_current_customer
    if session[:customer_id]
      @current_customer = Customer.find(session[:customer_id])
    end
  end
end