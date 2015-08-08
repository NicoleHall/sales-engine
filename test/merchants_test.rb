require 'test_helper'
require_relative "../lib/sales_engine"

class MerchantsTest < SeTest

  attr_reader :merchant_repository, :sales_engine, :item_repository

  def setup
    @sales_engine = SalesEngine.new(fixtures_dir)
    @merchant_repository = MerchantRepository.new(fixtures_dir, sales_engine)
    @item_repository = ItemRepository.new(fixtures_dir, sales_engine)
  end


  def test_it_requires_the_right_merchants
  result = merchant_repository.merchants[0].items
  result2 = result.map do |item|
    item.id
  end
    assert_equal [1,2,3,4], result2[0..3]
    assert_equal "Item Qui Esse", result[0].name
  end
end
