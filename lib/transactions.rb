class Transactions
  attr_reader :id,
              :invoice_id,
              :credit_card_number,
              :credit_card_expiration_date,
              :result,
              :created_at,
              :updated_at
           #  :transaction_repository

# add transaction_repository to initialize and the readers
  def initialize(id,
                 invoice_id,
                 credit_card_number,
                 credit_card_expiration_date=0000,
                 result,
                 created_at,
                 updated_at)
    @id = id.to_i
    @invoice_id = invoice_id#.to_i
    @credit_card_number = credit_card_number#.to_i
    @credit_card_expiration_date = credit_card_expiration_date# Date.parse(created_at)
    @result = result
    @created_at = created_at# Date.parse(created_at)
    @updated_at = updated_at# Date.parse(updated_at)
    # @transaction_repository = transaction_repository
  end
end