require 'test_helper'

class ItemsTest < SeTest

  attr_reader :sales_engine, :item_repository

  def setup
    @sales_engine = SalesEngine.new(fixtures_dir)
    @item_repository = ItemRepository.new(fixtures_dir, sales_engine)
  end

  def test_it_can_find_invoice_items_by_item_id
    invoice_items_collection = item_repository.items[1].invoice_items
    iic = invoice_items_collection
    result = iic.map do |invoice|
                        invoice.id
                      end
    result2 = result[0..4]
    assert_equal [10, 11, 12], result2[0..3]
    assert_equal 11, iic[1].id
  end

  def test_it_can_find_a_merchant_by_item_id
    merchant = item_repository.items[1].merchants

    assert_equal 1, merchant.id
  end

end
