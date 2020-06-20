class AccidentInvoiceController < ApplicationController
  def index
    @invoices = AccidentInvoice.all
  end

  def new
    @invoice = AccidentInvoice.new
  end
end
