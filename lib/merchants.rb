class Merchants
  attr_reader :id, :name, :created_at, :updated_at, :repository

  def initialize(id, name, created_at, updated_at, repository)
    @id         = id.to_i
    @name       = name
    @created_at = created_at
    @updated_at = updated_at
    @repository = repository
  end

  def inspect
    "#<#{self.class} #{self.id}>"
  end

  def items
    repository.sales_engine.find_items_by_merchant_id(id)
  end

  def invoices
    repository.sales_engine.find_invoices_by_merchant_id(id)
  end

  def invoices_for_successful_transactions
    invoices.select do |invoice|
       invoice.paid? == true
     end
  end

  def paid_invoice_items
    invoices_for_successful_transactions.map do |invoice|
      invoice.invoice_items
    end.flatten
  end

  def revenue
    paid_invoice_items.map do |invoice_item|
      invoice_item.quantity * invoice_item.unit_price
    end.reduce(:+)
  end

end

# Date.parse(created_at)
# Date.parse(updated_at)
