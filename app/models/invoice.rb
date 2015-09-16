class Invoice < ActiveRecord::Base
  has_many :transactions
  has_many :invoice_items
  belongs_to :customer
  belongs_to :merchant

  def items
    invoice_items.map { |ii| ii.item }.flatten 
  end
  # def self.successful_invoices
  #   joins(:transactions).where('transactions.result' => "success")
  # end
end
