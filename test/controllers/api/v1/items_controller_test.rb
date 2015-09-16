require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    items   = JSON.parse(response.body)
    item    = items.first

    assert_response :success
    assert_equal 3, items.count
    assert 3,       item["item_id"]
  end

  test "#show" do
    get :show, format: :json, id: InvoiceItem.first.id

    item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Random object",            item[:name]
    assert_equal "This is a random object",  item[:description]
    assert_equal "30.0",                     item[:unit_price]
    assert_equal 113629430,                          item[:merchant_id]
  end

  test "#find" do
    get :find, format: :json, id: Item.first.id

    item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Random object", item[:name]
    assert_equal "This is a random object", item[:description]
    assert_equal "30.0", item[:unit_price]
    assert_equal 113629430, item[:merchant_id]
  end

  test "#find_all" do
    get :find_all, format: :json, item_id: Item.first.id

    item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 3, item.count
    assert_equal 980190962, item.first[:id]
  end

  test "#invoice_items" do
    get :invoice_items, format: :json, item_id: Item.first.id

    invoice_items = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 1, invoice_items.count
  end

  test "#merchant" do
    get :merchant, format: :json, item_id: Item.first.id

    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Nader-Hyatt", merchant[:name]
  end
end
