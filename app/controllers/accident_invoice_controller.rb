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
      analyse_invoice
      redirect_to accident_invoice_path(@invoice), notice: 'Invoice is create Susscessful'
    else
      render :new, error: 'Failed to create new Invoice'
    end
  end

  def show
    @invoice = AccidentInvoice.find(params[:id])
    get_analyse_result unless @invoice.extract_finish?
  end

  private 

  def invoice_params
    params.require(:accident_invoice).permit(:name, :invoice)
  end

  def analyse_invoice
    analyzer = InvoiceAnalyzer.new(@invoice)
    analyzer.perform
    @invoice.invoice_number = analyzer.invoice_number if analyzer.invoice_number
    @invoice.vin = analyzer.vin if analyzer.vin
    @invoice.plate = analyzer.plate if analyzer.plate
    @invoice.save
  end

  def get_analyse_result
    analyzer = InvoiceAnalyzer.new(@invoice)
    analyzer.get_results

    @invoice.invoice_number = analyzer.invoice_number if analyzer.invoice_number
    @invoice.vin = analyzer.vin if analyzer.vin
    @invoice.plate = analyzer.plate if analyzer.plate
    @invoice.save
  end
end
