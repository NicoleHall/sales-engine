require_relative 'merchant_repo'
require_relative 'item_repo'
require_relative 'invoice_repository'
require 'pry'
class SalesEngine

  attr_reader :merchant_repository, :item_repository, :invoice_repository
  def initialize(dir="data")
    @invoice_repository = InvoiceRepository.new(dir, self)
    @item_repository = ItemRepository.new(dir, self)
    @merchant_repository = MerchantRepository.new(dir, self)
    @merchant_repository.create_merchants
  end

  def find_items_by_merchant_id(id)
    item_repository.find_all_by_merchant_id(id) ###this is getting teh wrong stuff, its finding the tiem id not the merchant id
  end

  def find_invoices_by_merchant_id(id)
    invoice_repository.find_all_by_merchant_id(id)
  end

end

if __FILE__ == $0
  engine = SalesEngine.new
  binding.pry
end
