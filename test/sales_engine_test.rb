require 'test_helper'

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

    assert_equal "shipped", result[0].status
  end

  def test_it_can_find_invoices_associate_with_a_transaction
    se = SalesEngine.new(fixtures_dir)
    result = se.find_invoice_for_transactions(5)

    assert_equal 1, result.customer_id
  end
end
