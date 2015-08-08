require 'test_helper'
require_relative '../lib/sales_engine'

class SalesEngineTest < SeTest

  def test_sales_engine_loads_the_merchant_repository_with_the_data
    se = SalesEngine.new(data_dir)
    mr = se.merchant_repository
    assert_equal "Schroeder-Jerde", mr.merchants[0].name
  end

  def test_it_can_find_items_associate_with_a_merchant
    se = SalesEngine.new(fixtures_dir)
    result = se.find_items_by_merchant_id(1)
    assert_equal "Item Qui Esse", result[0].name
  end

  def test_it_can_find_invoices_associate_with_a_merchant
    se = SalesEngine.new(fixtures_dir)
    result = se.find_invoices_by_merchant_id(1)
    assert_equal "Item Qui Esse", result[0].name
  end

end
