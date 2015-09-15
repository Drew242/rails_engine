require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    invoices   = JSON.parse(response.body)
    invoice    = invoices.first

    assert_response :success
    assert_equal 3, invoices.count
    assert 3,       invoice["customer_id"]
  end

  test "#show" do
    get :show, format: :json, id: InvoiceItem.first.id

    invoice = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 1,          invoice[:customer_id]
    assert_equal 1,          invoice[:merchant_id]
    assert_equal "shipped",  invoice[:status]
  end

  test "#find" do
    get :find, format: :json, id: Invoice.first.id

    invoice = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 1,         invoice[:customer_id]
    assert_equal 1,         invoice[:merchant_id]
    assert_equal "shipped", invoice[:status]
  end

  test "#find_all" do
    get :find_all, format: :json, item_id: Invoice.first.id

    invoice = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 3,         invoice.count
    assert_equal 980190962, invoice.first[:id]
  end
end
