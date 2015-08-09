require 'test_helper'
require_relative '../lib/merchant_repo'
require_relative '../lib/sales_engine'

#the tests that look for fixtures data go here

class MerchantRepositoryTest < SeTest
  attr_reader :merchant_repository, :sales_engine

  def setup
    @sales_engine = SalesEngine.new(fixtures_dir)
    @merchant_repository = MerchantRepository.new(fixtures_dir, sales_engine)
  end

  def test_has_a_class
    assert MerchantRepository
  end

  def test_it_can_find_all
    merchants = merchant_repository.all
    assert_equal 10, merchants.size
  end

  def test_it_can_return_a_random_merchant_instance
    skip   ########  !!!!!!!!  Unskip this before assessment, it works
    merchant_repository = MerchantRepository.new(fixtures_dir, sales_engine)
    mr1 = merchant_repository.random
    mr2 = merchant_repository.random
    mr3 = merchant_repository.random

    refute_equal mr1, mr2
    refute_equal mr1, mr3
    refute_equal mr2, mr3
  end

  def test_it_can_find_matching_merchant_by_id
    merchant_repository = MerchantRepository.new(fixtures_dir, sales_engine)

    result = merchant_repository.find_by_id(5)
    assert_equal 5, result.id
  end

  def test_it_can_find_by_name
    merchant_repository = MerchantRepository.new(fixtures_dir, sales_engine)
    result = merchant_repository.find_by_name("Schroeder-Jerde")

    assert_equal "Schroeder-Jerde", result.name
  end

  def test_it_can_find_by_date_created_at
    merchant_repository = MerchantRepository.new(fixtures_dir, sales_engine)
    result = merchant_repository.find_by_created_at("2012-03-27 14:53:59 UTC")

    assert_equal 1, result.id
    assert_equal "2012-03-27 14:53:59 UTC", result.created_at
  end

  def test_it_can_find_by_date_updated_at
    merchant_repository = MerchantRepository.new(fixtures_dir, sales_engine)
    result = merchant_repository.find_by_updated_at("2012-03-27 16:12:25 UTC")

    assert_equal "2012-03-27 16:12:25 UTC", result.updated_at
    assert_equal 6, result.id
  end

  def test_it_can_find_all_merchants_by_id
    ### why is this method ?
    merchant_repository = MerchantRepository.new(fixtures_dir, sales_engine)

    result = merchant_repository.find_all_by_id(5)
    assert_equal 5, result[0].id
  end

  def test_it_can_find_all_merchants_by_name
    merchant_repository = MerchantRepository.new(fixtures_dir, sales_engine)

    result = merchant_repository.find_all_by_name("Williamson Group")
    assert_equal 2, result.count
  end

  def test_it_can_find_all_merchants_by_created_at
    merchant_repository = MerchantRepository.new(fixtures_dir, sales_engine)

    result = merchant_repository.find_all_by_created_at("2012-03-27 14:53:59 UTC")
    assert_equal 9, result.count
  end

  def test_it_can_find_all_merchants_by_updated_at
    merchant_repository = MerchantRepository.new(fixtures_dir, sales_engine)

    result = merchant_repository.find_all_by_updated_at("2012-03-27 14:53:59 UTC")
    assert_equal 8, result.count
  end

end
