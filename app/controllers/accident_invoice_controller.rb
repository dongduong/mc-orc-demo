class AccidentInvoiceController < ApplicationController
  def index
    @invoices = AccidentInvoice.all
  end

  def new
    @invoice = AccidentInvoice.new
  end

  def create
    @invoice = AccidentInvoice.new(invoice_params)

    if @invoice.save
      redirect_to accident_invoice_path(@invoice), notice: 'Invoice is create Susscessful'
    else
      render :new, error: 'Failed to create new Invoice'
    end
  end

  def show
    @invoice = AccidentInvoice.find(params[:id])
  end

  private 

  def invoice_params
    params.require(:accident_invoice).permit(:invoice_file)
  end
end
