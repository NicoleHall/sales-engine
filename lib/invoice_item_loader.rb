require_relative 'invoice_items'
require_relative 'fileio'

class InvoiceItemLoader
  #pass in invoice_item_repository into intiialize which becaomes the reader which accesses self on the other end
  # add the reader invoice repository
  # and # @invoice_item_repository = invoice_item_repository into initialize
  attr_reader :invoice_items

  def initialize(dir)
    @invoice_items     = []
    @dir               = dir
  end

  def data
    FileIO.load_file("#{@dir}/invoice_items.csv")
  end

  # add the argument invoice_repository to the Invoice object
  def load_invoice_items
    data.each do |row|
      @invoice_items << InvoiceItems.new(row[:id], row[:item_id], row[:invoice_id], row[:quantity], row[:unit_price], row[:created_at], row[:updated_at])
    end
    @invoice_items
  end
end
