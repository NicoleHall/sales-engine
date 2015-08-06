require 'test_helper'
require_relative '../lib/merchant_repo'

#the tests that look for fixtures data go here

class MerchantRepositoryTest < SeTest

  # meta crnt: true
  def test_has_a_class
    assert MerchantRepository
  end

  def test_it_can_find_all
    mr = MerchantRepository.new(data_dir)
    mr.create_merchants
    assert_equal 10, mr.all.size
  end

  def test_it_can_return_a_random_merchant_instance
    mr = MerchantRepository.new(data_dir)
    mr.create_merchants
    mr1 = mr.random
    mr2 = mr.random
    mr3 = mr.random

    refute_equal mr1, mr2
    refute_equal mr1, mr3
    refute_equal mr2, mr3
  end

  def test_it_can_find_matching_merchant_by_id
    skip
    mr = MerchantRepository.new("data")
    result = mr.find_by_id(5)

    assert_equal  5,result.id
  end

  def test_it_creates_merchant_objects
    skip
    #pass this to the right test file
    se = SalesEngine.new
    mr = se.merchant_repo
    expected = mr.count
    assert_equal 10, expected
  end

  def test_merchant_has_a_name
    skip
    merchant = Merchant.new("1", "name", 5, 3)
    assert_equal "name", merchant.name
  end

  def test_merchant_has_id
    skip
    merchant = Merchant.new("1", "name", 5, 3)
    assert_equal "1", merchant.id
  end


end
