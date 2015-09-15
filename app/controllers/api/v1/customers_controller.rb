class Api::V1::CustomersController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find_by(id: params[:id])
  end

  def find
    respond_with Customer.find_by(customer_params)
  end

  def find_all
    respond_with Customer.where(customer_params)
  end

  def random
    random = rand(Customer.count)
    respond_with Customer.find(id: random)
  end

  private

  def customer_params
    params.permit(:id, :first_name, :last_name)
  end
end
