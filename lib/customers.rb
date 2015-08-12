class Customer
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at,
              :customer_repository

  def initialize(id, first_name, last_name, created_at, updated_at, customer_repository)
    @id = id.to_i
    @first_name = first_name
    @last_name  = last_name
    @created_at = created_at
    @updated_at = updated_at
    @customer_repository = customer_repository

  end

  def inspect
    "#<#{self.class} #{self.id}>"
  end

  def invoices
    customer_repository.sales_engine.find_invoices_by_customer_id(id)
  end

  def transactions
    invoices.map do |invoice|
      x = invoice.id
      invoice.invoice_repository.sales_engine.find_transactions_for_an_invoice(x)
    end.flatten
  end

end
# invoice.invoice_repository.sales_engine.find_transactions_for_an_invoice(1)
