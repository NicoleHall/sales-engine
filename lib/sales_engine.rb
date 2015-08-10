require_relative 'merchant_repo'
require_relative 'item_repo'
require_relative 'invoice_repository'
require_relative 'customer_repository'
require_relative 'transaction_repository'
require_relative 'invoice_items'

class SalesEngine

  attr_reader :merchant_repository, :item_repository, :invoice_repository,
              :customer_repository, :transaction_repository, :invoice_item_repository
  def initialize(dir="data")
    @invoice_repository      ||= InvoiceRepository.new(dir, self)
    @item_repository         ||= ItemRepository.new(dir, self)
    @merchant_repository     ||= MerchantRepository.new(dir, self)
    @customer_repository     ||= CustomerRepository.new(dir, self)
    @transaction_repository  ||= TransactionRepository.new(dir, self)
    @invoice_item_repository ||= InvoiceItemRepository.new(dir, self)
  end

  def find_items_by_merchant_id(id)
    item_repository.find_all_by_merchant_id(id)
  end

  def find_invoices_by_merchant_id(id)
    invoice_repository.find_all_by_merchant_id(id)
  end

  def find_invoices_by_customer_id(id)
    invoice_repository.find_all_by_customer_id(id)
  end

  def find_invoice_for_transactions(invoice_id)
    invoice_repository.find_by_id(invoice_id)
  end

  def find_invoice_items_by_item_id(item_id)
    invoice_item_repository.find_all_invoice_items_by_item_id(item_id)
  end

  def find_merchant_for_item(merchant_id)
    merchant_repository.find_by_id(merchant_id)
  end

  def find_invoice_for_invoice_item(invoice_id)
    invoice_repository.find_by_id(invoice_id)
  end

  def find_item_for_invoice_item_by_item_id(item_id)
    item_repository.find_by_id(item_id)
  end

  def find_merchant_for_an_invoice(merchant_id)
    merchant_repository.find_by_id(merchant_id)
  end

  def find_customer_for_an_invoice(customer_id)
    customer_repository.find_by_id(customer_id)
  end

  def find_transactions_for_an_invoice(id)
    transaction_repository.find_all_transactions_by_invoice_id(id)
  end

  def find_invoice_items_for_an_invoice(id)
    invoice_item_repository.find_all_invoice_items_by_invoice_id(id)
  end

  def find_all_item_for_invoice_item_by_item_id(item_id)
    item_repository.find_by_id(item_id)
  end

  # def find_items_by_way_of_invoice_items(id)
  #   invoice_item_repository.find_all_invoice_items_by_id(id)
  # end

end

if __FILE__ == $0
  engine = SalesEngine.new
  binding.pry
end
