require_relative 'merchant_repo'
require_relative 'customer_repository'
require_relative 'transaction_repository'
require_relative 'invoice_repository'
#require_relative 'invoice_item_repository'
class SalesEngine

  attr_reader :merchant_repo, :customer_repo
  def initialize(dir="data")
    @merchant_repo = MerchantRepository.new(dir)
    @merchant_repo.create_merchants
    @customer_repo = CustomerRepository.new(dir)
    @customer_repo.create_customers
    @transaction_repo = TransactionRepository.new(dir)
    @transaction_repo.create_transactions
    @invoice_repo = InvoiceRepository.new(dir)
    @invoice_repo.create_invoices
  end
end
