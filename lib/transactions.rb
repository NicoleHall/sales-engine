require 'Date'
class Transactions
  attr_reader :id, :invoice_id, :credit_card_number,
              :credit_card_expiration_date, :result,
              :created_at, :updated_at, :repository

  def initialize(id, invoice_id, credit_card_number,
                 credit_card_expiration_date=0000,
                 result, created_at, updated_at, repository)

    @id                          = id.to_i
    @invoice_id                  = invoice_id.to_i
    @credit_card_number          = credit_card_number.to_i
    @credit_card_expiration_date = credit_card_expiration_date
    @result                      = result
    @created_at                  = (created_at)
    @updated_at                  = (updated_at)
    @repository                  = repository
  end

  def inspect
    "#<#{self.class} #{self.id}>"
  end

   def invoice
     repository.sales_engine.find_invoice_for_transactions(invoice_id)
   end

   def successful?
     result == "success"
   end

end
