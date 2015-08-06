require 'test_helper'
require_relative '../lib/sales_engine'

class SalesEngineTest < SeTest

  # meta crnt: true
  def test_sales_engine_loads_the_merchant_repository_with_the_data
    se = SalesEngine.new(data_dir)
    mr = se.merchant_repo
    assert_equal "Schroeder-Jerde", mr.merchants[0].name
  end

  def test_merchant_has_a_name
    merchant = Merchant.new("1", "name", 5, 3)
    assert_equal "name", merchant.name
  end
end
