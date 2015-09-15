require 'csv'

desc "Import csvs from csv file"
task :import => [:environment] do

  customers = File.read("db/csvs/customers.csv")
  parsed    = CSV.parse(customers, headers: true)
  parsed.each do |row|
    Customer.create(row.to_h.except("id"))
  end

  merchants = File.read("db/csvs/merchants.csv")
  parsed    = CSV.parse(merchants, headers: true)
  parsed.each do |row|
    Merchant.create(row.to_h.except("id"))
  end

  items  = File.read("db/csvs/items.csv")
  parsed = CSV.parse(items, headers: true)
  parsed.each do |row|
    Item.create(row.to_h.except("id"))
  end

  invoices = File.read("db/csvs/invoices.csv")
  parsed   = CSV.parse(invoices, headers: true)
  parsed.each do |row|
    Invoice.create(row.to_h.except("id"))
  end

  invoice_items = File.read("db/csvs/invoice_items.csv")
  parsed        = CSV.parse(invoice_items, headers: true)
  parsed.each do |row|
    InvoiceItem.create(row.to_h.except("id"))
  end

  transactions  = File.read("db/csvs/transactions.csv")
  parsed = CSV.parse(transactions, headers: true)
  parsed.each do |row|
    Transaction.create(row.to_h.except("id", "credit_card_expiration_date"))
  end
end
