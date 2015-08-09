require_relative 'invoice_items'
require_relative 'fileio'

class InvoiceItemLoader

  attr_reader :invoice_items, :invoice_item_repository

  def initialize(dir, invoice_item_repository)
    @invoice_items           = []
    @dir                     = dir
    @invoice_item_repository = invoice_item_repository
  end

  def data
    FileIO.load_file("#{@dir}/invoice_items.csv")
  end

  def load_invoice_items
    data.each do |row|
      @invoice_items << InvoiceItems.new(row[:id], row[:item_id], row[:invoice_id], row[:quantity], row[:unit_price], row[:created_at], row[:updated_at], invoice_item_repository)
    end
    @invoice_items
  end
end
