require_relative 'test_helper'

class InvoiceItemsTest < SeTest

  attr_reader :invoice_item_repository, :item_repository, :sales_engine

  def setup
    @sales_engine = SalesEngine.new(fixtures_dir)
    @invoice_item_repository = InvoiceItemRepository.new(fixtures_dir, sales_engine)
  end

  def test_it_can_return_an_invoice_for_an_item
      result = invoice_item_repository.invoice_items[7].invoice

      assert_equal 1, result.id
  end

  def test_it_can_return_an_item_for_an_invoice_item
    result = invoice_item_repository.invoice_items[11].item
    assert_equal "Item Qui Esse", result.name
  end
end
