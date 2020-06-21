class CreateAccidentInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :accident_invoices do |t|
      t.string :name
      t.attachment :invoice

      t.timestamps
    end
  end
end
