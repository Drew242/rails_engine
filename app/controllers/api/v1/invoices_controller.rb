class Api::V1::InvoicesController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Invoice.all
  end

  def show
    respond_with Invoice.find_by(id: params[:id])
  end

  def create
    respond_with Invoice.create(invoice_params)
  end

  def update
    respond_with Invoice.update(params[:id], invoice_params)
  end

  def destroy
    respond_with Invoice.destroy(params[:id])
  end

  private

  def invoice_params
    params.require(:invoice).permit(:customer_id, :merchant_id, :status)
  end
end
