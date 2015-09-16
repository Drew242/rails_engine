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
    Item.create({
          name:        row["name"],
          description: row["description"],
          unit_price:  row["unit_price"].to_f/100,
          merchant_id: row["merchant_id"],
          created_at:  row["created_at"],
          updated_at:  row["updated_at"]
    }
    )
  end

  invoices = File.read("db/csvs/invoices.csv")
  parsed   = CSV.parse(invoices, headers: true)
  parsed.each do |row|
    Invoice.create(row.to_h.except("id"))
  end

  invoice_items = File.read("db/csvs/invoice_items.csv")
  parsed        = CSV.parse(invoice_items, headers: true)
  parsed.each do |row|
    InvoiceItem.create({
                item_id:    row["item_id"],
                invoice_id: row["invoice_id"],
                quantity:   row["quantity"],
                unit_price: row["unit_prices"].to_f/100,
                created_at: row["created_at"],
                updated_at: row["updated_at"]
      })
  end

  transactions  = File.read("db/csvs/transactions.csv")
  parsed = CSV.parse(transactions, headers: true)
  parsed.each do |row|
    Transaction.create(row.to_h.except("id", "credit_card_expiration_date"))
  end
end
