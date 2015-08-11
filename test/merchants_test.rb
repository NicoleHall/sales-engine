require 'test_helper'

class MerchantsTest < SeTest

  attr_reader :merchant_repository, :sales_engine

  def setup
    @sales_engine = SalesEngine.new(fixtures_dir)
    @merchant_repository = MerchantRepository.new(fixtures_dir, sales_engine)
  end

  def test_it_can_access_the_items_associated_with_a_merchant
    result = merchant_repository.merchants[0].items
    result2 = result.map do |item|
                      item.id
                      end
    assert_equal [1,2,3,4], result2[0..3]
    assert_equal "Item Qui Esse", result[0].name
  end

  def test_it_requires_the_right_merchants_from_invoices
    result = merchant_repository.merchants[7].invoices
    result2 = result.map do |invoice|
                        invoice.id
                      end
    assert_equal [2], result2[0..3]
    assert_equal 3, result[0].customer_id
  end

end
