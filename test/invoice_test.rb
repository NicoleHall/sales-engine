require 'test_helper'

class InvoiceTest < SeTest

  attr_reader :merchant_repository, :sales_engine, :item_repository

  def setup
    @sales_engine = SalesEngine.new(fixtures_dir)
    @merchant_repository = MerchantRepository.new(fixtures_dir, sales_engine)
    @item_repository = ItemRepository.new(fixtures_dir, sales_engine)
    @invoice_repository = InvoiceRepository.new(fixtures_dir, sales_engine)
  end



end
