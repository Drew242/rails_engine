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
    assert_equal 3,  invoice_item[:item_id]
    assert_equal 3,  invoice_item[:invoice_id]
    assert_equal 9,  invoice_item[:quantity]
    assert_equal "350.0",  invoice_item[:unit_price]
  end
end
