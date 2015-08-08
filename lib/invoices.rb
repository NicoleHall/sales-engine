class Invoices

  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at
           #  :invoice_repository

# add invoice_repository to initialize and the readers
  def initialize(id,
                 customer_id,
                 merchant_id,
                 status,
                 created_at,
                 updated_at)
    @id = id.to_i
    @customer_id = customer_id#.to_i
    @merchant_id = merchant_id#.to_i
    @status = status
    @created_at = created_at# Date.parse(created_at)
    @updated_at = updated_at# Date.parse(updated_at)
    # @transaction_repository = transaction_repository
  end
end
