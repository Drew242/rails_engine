class Api::V1::MerchantsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def find
    respond_with Merchant.find_by(merchant_params)
  end

  def find_all
    respond_with Merchant.where(merchant_params)
  end

  def random
    random = rand(Merchant.count)
    respond_with Merchant.find(id: random)
  end

  private

  def merchant_params
    params.permit(:id, :name)
  end
end
