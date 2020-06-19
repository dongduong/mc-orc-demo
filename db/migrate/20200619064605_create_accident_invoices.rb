class CreateAccidentInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :accident_invoices do |t|
      t.string :invoice_number
      t.datetime :accident_date
      t.string :vin
      t.string :car_plate

      t.timestamps
    end
  end
end
