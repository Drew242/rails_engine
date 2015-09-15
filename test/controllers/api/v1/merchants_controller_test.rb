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
    get :show, format: :json, id: InvoiceItem.first.id

    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Nader-Hyatt",  merchant[:name]
  end
end
