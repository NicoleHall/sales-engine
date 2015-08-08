class Invoices

  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at
              :invoice_repository

  def initialize(id,
                customer_id,
                merchant_id,
                status,
                created_at,
                updated_at,
                invoice_repository)
    @id                 = id.to_i
    @customer_id        = customer_id.to_i
    @merchant_id        = merchant_id.to_i
    @status             = status
    @created_at         = created_at
    @updated_at         = updated_at
    @invoice_repository = invoice_repository
  end

end
