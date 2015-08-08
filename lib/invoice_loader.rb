require_relative 'invoices'
require_relative 'fileio'

class InvoiceLoader

  attr_reader :invoices, :invoice_repository

  def initialize(dir, invoice_repository)
    @invoices           = []
    @dir                = dir
    @invoice_repository = invoice_repository
  end

  def data
    FileIO.load_file("#{@dir}/invoices.csv")
  end

  # add the argument invoice_repository to the Invoice object
  def load_invoices
    data.each do |row|
      @invoices << Invoices.new(row[:id], row[:customer_id], row[:merchant_id], row[:status], row[:created_at], row[:updated_at], invoice_repository)
    end
    @invoices
  end
end
