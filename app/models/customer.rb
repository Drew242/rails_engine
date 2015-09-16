class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def transactions
    invoices.map { |invoice| invoice.transactions }.flatten
  end
end
