class AccidentInvoiceController < ApplicationController
  def index
    @invoices = AccidentInvoice.all
  end
end
