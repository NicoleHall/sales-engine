require 'bigdecimal'
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
       invoice.paid?
     end
  end

  def successful_invoice_items_by_date(date = nil)
    invoices_for_successful_transactions.map do |invoice|
      if invoice.created_at == date
        return invoice.invoice_items
      end
    end
  end

  def paid_invoice_items
    invoices_for_successful_transactions.map do |invoice|
      invoice.invoice_items
    end.flatten
  end

  def total_revenue
    x = paid_invoice_items.map do |invoice_item|
      invoice_item.quantity * invoice_item.unit_price
    end.reduce(:+)
    BigDecimal.new(x) / 100
  end

  def revenue_by_date(date = nil)
    x = successful_invoice_items_by_date(date).map do |invoice_item|
      # binding.pry
      invoice_item.quantity * invoice_item.unit_price
    end.reduce(:+)
    BigDecimal.new(x) / 100
  end

  # def revenue_by_date(date)
  #     invoices.select do
  # end
##can I clean this up a little?  pull out the data and run through bigD in 2 methods?
  def revenue(date = nil)
    if date == nil
      total_revenue
    else
      revenue_by_date(date)
    end
  end

end

# Date.parse(created_at)
# Date.parse(updated_at)
