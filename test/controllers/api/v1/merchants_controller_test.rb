require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    merchants   = JSON.parse(response.body)
    merchant    = merchants.first

    assert_response :success
    assert_equal 3, merchants.count
    assert 3,       merchant["merchant_id"]
  end

  test "#show" do
    get :show, format: :json, id: Merchant.first.id

    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Nader-Hyatt",  merchant[:name]
  end

  test "#find" do
    get :find, format: :json, id: Merchant.first.id

    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Nader-Hyatt", merchant[:name]
    assert_equal 113629430, merchant[:id]
  end

  test "#find_all" do
    get :find_all, format: :json, item_id: Merchant.first.id

    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 3, merchant.count
    assert_equal 980190962, merchant.first[:id]
  end
end
