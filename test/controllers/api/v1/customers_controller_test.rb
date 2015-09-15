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

  test "#find" do
    get :find, format: :json, id: Customer.first.id

    customer = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Andrew", customer[:first_name]
    assert_equal "Carmer", customer[:last_name]
  end

  test "#find_all" do
    get :find_all, format: :json, first_name: Customer.first.first_name

    customer = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 1,        customer.count
    assert_equal "Andrew", customer.first[:first_name]
  end
end
