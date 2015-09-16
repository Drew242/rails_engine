require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    invoice_items   = JSON.parse(response.body)
    invoice_item    = invoice_items.first

    assert_response :success
    assert_equal 3, invoice_items.count
    assert 3,       invoice_item["item_id"]
  end

  test "#show" do
    get :show, format: :json, id: InvoiceItem.first.id

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 980190962, invoice_item[:item_id]
    assert_equal 980190962, invoice_item[:invoice_id]
    assert_equal 9,         invoice_item[:quantity]
    assert_equal "350.0",   invoice_item[:unit_price]
  end

  test "#find" do
    get :find, format: :json, id: InvoiceItem.first.id

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 980190962, invoice_item[:item_id]
    assert_equal 980190962, invoice_item[:invoice_id]
    assert_equal 9,         invoice_item[:quantity]
    assert_equal "350.0",   invoice_item[:unit_price]
  end

  test "#find_all" do
    get :find_all, format: :json, item_id: InvoiceItem.first.item_id

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 1,         invoice_item.count
    assert_equal 980190962, invoice_item.first[:item_id]
  end

  test "#invoice" do
    get :item, format: :json, invoice_item_id: InvoiceItem.first.id

    item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 980190962, item[:id]
  end

  test "#items" do

  end
end
