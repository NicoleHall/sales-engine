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

  def invoices
    customer_repository.sales_engine.find_invoices_by_customer_id(id)
  end

end
