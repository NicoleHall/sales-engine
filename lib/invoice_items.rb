class InvoiceItems

  attr_reader :id, :item_id, :invoice_id, :quantity, :unit_price, :created_at,
              :updated_at, :invoice_item_repository

  def initialize(id, item_id, invoice_id, quantity, unit_price, created_at,
                 updated_at, invoice_item_repository)
    @id = id.to_i
    @item_id = item_id.to_i
    @invoice_id = invoice_id.to_i
    @quantity = quantity.to_i
    @unit_price = unit_price.to_i
    @created_at = (created_at)
    @updated_at = (updated_at)
    @invoice_item_repository = invoice_item_repository
  end

  def inspect
    "#<#{self.class} #{self.id}>"
  end

  def invoice
    invoice_item_repository.sales_engine.find_invoice_for_invoice_item(invoice_id)
  end

  def item
    invoice_item_repository.sales_engine.find_item_for_invoice_item_by_item_id(item_id)
  end

  def items_for_invoices
    invoice_item_repository.sales_engine.find_item_for_invoice_item_by_item_id(invoice_id)
  end
end
