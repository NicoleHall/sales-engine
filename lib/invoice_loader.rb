require_relative 'invoices'
require_relative 'fileio'

class InvoiceLoader

  ##change everything

  #pass in invoice repo into intiialize which becaomes the reader which accesses self on the other end
  # add the reader invoice repository
  # and # @invoice_repository = invoice_repository into initialize
  attr_reader :invoices

  def initialize(dir)
    @invoices     = []
    @dir          = dir
  end

  def data
    FileIO.load_file("#{@dir}/invoices.csv")
  end

  # add the argument invoice_repository to the Invoice object
  def load_invoices
    data.each do |row|
      @invoices << Invoices.new(row[:id], row[:customer_id], row[:merchant_id], row[:status], row[:created_at], row[:updated_at])
    end
    @invoices
  end
end
