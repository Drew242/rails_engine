require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    customers   = JSON.parse(response.body)
    customer    = customers.first

    assert_response :success
    assert_equal 3, customers.count
    assert "Drew",  customer["name"]
  end

  test "#show" do
    get :show, format: :json, id: Customer.first.id

    customer = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Andrew",  customer[:first_name]
    assert_equal "Carmer",  customer[:last_name]
  end
end
