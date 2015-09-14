class CreateInvoiceItems < ActiveRecord::Migration
  def change
    create_table :invoice_items do |t|
      t.references :item, index: true, foreign_key: true
      t.string :invoice_references
      t.integer :quantity
      t.decimal :unit_price

      t.timestamps null: false
    end
  end
end
