require "minitest/autorun"
require "minitest/pride"
require "./sales_engine"

class SalesEngineTest < Minitest::Test

  def test_it_can_load_files
    se=SalesEngine.new
    se.load_data("fixtures.csv")
    result = se.mr.merchants.count
    assert_equal 10, result
  end

  def test_merchant_has_a_name
    merchant = Merchant.new("1", "name")
    assert_equal "name", merchant.name
  end

end
