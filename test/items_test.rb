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
    assert_equal 12, iic[1].id
  end

end
