class InvoiceAnalyzer
  attr_accessor :vin, :invoice_number, :plate

  INVOICE_NUMBER_KEYS = [
    'Ordnungsnummer',
    'Rechnung-Nr',
    'Rechnung'
  ]

  VIN_KEYS = [
    'VIN',
    'Fg-Nr'
  ]

  PLATE_KEYS = [
    'Amtliches Kennzei',
    'Amtliches Kennzeichen',
    'Amtl. Kennzeichen',
    'Auftrag'
  ]

  def initialize(accident_invoice)
    @invoice = accident_invoice
    @vin = nil
    @invoice_number = nil
    @plate = nil
  end

  def perform
    service = Ocr::Textract.new(file_path)
    #service.detect_document_text_async
    service.analyze_document_async

    #store all key_values
    service.store_all_key_values(@invoice)

    #extract data
    INVOICE_NUMBER_KEYS.each do |key|
      if value = service.find_by_key(key)
        @invoice_number = value
        break
      end
    end

    VIN_KEYS.each do |key|
      if value = service.find_by_key(key)
        @vin = value
        break
      end
    end

    PLATE_KEYS.each do |key|
      if value = service.find_by_key(key)
        @plate = value
        break
      end
    end
  end

  private

  def file_path
    "mc-orc-demo/invoice/#{@invoice.id}/#{@invoice.invoice_file_name}"
  end
end
