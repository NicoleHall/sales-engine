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

  def transactions
    invoices.flat_map do |invoice|
      invoice.transactions
    end
  end

  def successful_transactions
    transactions.select do |transaction|
      transaction.successful? == true
    end
  end

# take these back to invoices and create a method for successfull invoices then you cn subtract the 2 arrays

  def invoices_for_successful_transactions
    successful_transactions.map do |transaction|
      transaction.invoice
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
    invoices_for_successful_transactions.flat_map do |invoice|
      invoice.invoice_items
    end
  end

  def total_revenue
    x = paid_invoice_items.map do |invoice_item|
      invoice_item.quantity * invoice_item.unit_price
    end.reduce(:+)
    BigDecimal.new(x) / 100
  end

  def revenue_by_date(date = nil)
    x = successful_invoice_items_by_date(date).map do |invoice_item|
      invoice_item.quantity * invoice_item.unit_price
    end.reduce(:+)
    BigDecimal.new(x) / 100
  end

##can I clean this up a little?  pull out the data and run through bigD in 2 methods?
  def revenue(date = nil)
    if date == nil
      total_revenue
    else
      revenue_by_date(date)
    end
  end

  def favorite_customer_id
    a = invoices_for_successful_transactions.map do |invoice|
      invoice.customer_id
    end
    a.uniq.max_by{ |id| a.count( id ) }
  end

  def favorite_customer
    repository.sales_engine.customer_repository.find_by_id(favorite_customer_id)
  end

  def invoices_for_unsuccessful_transactions
    invoices - invoices_for_successful_transactions
  end

  def customers_with_pending_invoices

  end


end

# Date.parse(created_at)
# Date.parse(updated_at)
