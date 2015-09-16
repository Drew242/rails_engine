require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    transactions   = JSON.parse(response.body)
    transaction    = transactions.first

    assert_response :success
    assert_equal 3, transactions.count
    assert 3,       transaction["transaction_id"]
  end

  test "#show" do
    get :show, format: :json, id: Transaction.first.id

    transaction = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 113629430,           transaction[:invoice_id]
    assert_equal "4232569591693416",  transaction[:credit_card_number]
    assert_equal "success",           transaction[:result]
  end

  test "#find" do
    get :find, format: :json, id: Transaction.first.id

    transaction = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 113629430,          transaction[:invoice_id]
    assert_equal "4232569591693416", transaction[:credit_card_number]
    assert_equal "success",          transaction[:result]
  end

  test "#find_all" do
    get :find_all, format: :json, item_id: Transaction.first.id

    transaction = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 3,         transaction.count
    assert_equal 980190962, transaction.first[:id]
  end

  test "#invoice" do
    get :invoice, format: :json, transaction_id: Transaction.first.id

    invoice = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 113629430, invoice[:id]
  end
end
