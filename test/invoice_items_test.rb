require_relative 'test_helper'

class InvoiceItemsTest < SeTest

  attr_reader :invoice_item_repository, :item_repository, :sales_engine

  def setup
    @sales_engine = SalesEngine.new(fixtures_dir)
    @invoice_item_repository = InvoiceItemRepository.new(fixtures_dir, sales_engine)
  end

end
