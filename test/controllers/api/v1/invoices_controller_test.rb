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
    assert_equal 980190962, invoice[:customer_id]
    assert_equal 113629430, invoice[:merchant_id]
    assert_equal "shipped", invoice[:status]
  end

  test "#find" do
    get :find, format: :json, id: Invoice.first.id

    invoice = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 980190962, invoice[:customer_id]
    assert_equal 113629430, invoice[:merchant_id]
    assert_equal "shipped", invoice[:status]
  end

  test "#find_all" do
    get :find_all, format: :json, invoice_id: Invoice.first.id

    invoice = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 3,         invoice.count
    assert_equal 980190962, invoice.first[:id]
  end

  test "#transactions" do
    get :transactions, format: :json, invoice_id: Invoice.first.id

    transactions = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 1, transactions.count
  end

  test "#invoice_items" do
    get :invoice_items, format: :json, invoice_id: Invoice.first.id

    invoice_items = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 1, invoice_items.count
  end

  test "#items" do
    get :items, format: :json, invoice_id: Invoice.first.id

    items = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 1, items.count
  end

  test "#customer" do
    get :customer, format: :json, invoice_id: Invoice.first.id

    customer = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Drew", customer[:first_name]
  end

  test "#merchant" do
    get :merchant, format: :json, invoice_id: Invoice.first.id

    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Nader-Hyatt", merchant[:name]
  end
end
