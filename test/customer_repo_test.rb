require_relative 'test_helper.rb'

class CustomerRepositoryTest < SeTest

  attr_reader :customer_repository, :sales_engine

  def setup
    @sales_engine = SalesEngine.new(fixtures_dir)
    @customer_repository = CustomerRepository.new(fixtures_dir, sales_engine)
  end

  def test_has_a_class
    assert CustomerRepository
  end

  def test_it_can_find_all
    cr = CustomerRepository.new(fixtures_dir, sales_engine)
    cr.create_customers
    assert_equal 10, cr.all.size
  end

  def test_it_can_return_a_random_customer_instance
    skip   ########  !!!!!!!!  Unskip this before assessment, it works
    cr = CustomerRepository.new(fixtures_dir, sales_engine)
    cr.create_customers
    cr1 = cr.random
    cr2 = cr.random
    cr3 = cr.random

    refute_equal cr1, cr2
    refute_equal cr1, cr3
    refute_equal cr2, cr3
  end

  def test_it_can_find_matching_customer_by_id
    cr = CustomerRepository.new(fixtures_dir, sales_engine)
    cr.create_customers

    result = cr.find_by_id(5)
    assert_equal 5, result.id
  end

  def test_it_can_find_customers_by_first_name
    cr = CustomerRepository.new(fixtures_dir, sales_engine)
    cr.create_customers
    result = cr.find_by_first_name("Joey")

    assert_equal "Joey", result.first_name
  end

  def test_it_can_find_customers_by_last_name
    cr = CustomerRepository.new(fixtures_dir, sales_engine)
    cr.create_customers
    result = cr.find_by_last_name("Ondricka")

    assert_equal "Ondricka", result.last_name
  end

  def test_it_can_find_customers_by_date_created_at
    cr = CustomerRepository.new(fixtures_dir, sales_engine)
    cr.create_customers
    result = cr.find_by_created_date("2012-03-27 14:54:09 UTC")

    assert_equal 1, result.id
    assert_equal "2012-03-27 14:54:09 UTC", result.created_at
  end

  def test_it_can_find_by_customers_date_updated_at
    cr = CustomerRepository.new(fixtures_dir, sales_engine)
    cr.create_customers
    result = cr.find_by_updated_date("2012-03-27 14:54:09 UTC")

    assert_equal "2012-03-27 14:54:09 UTC", result.updated_at
    assert_equal 1, result.id
  end

  def test_it_can_find_all_customers_by_id
    cr = CustomerRepository.new(fixtures_dir, sales_engine)
    cr.create_customers

    result = cr.find_all_by_id(5)
    assert_equal 5, result[0].id
  end

  def test_it_can_find_all_customers_by_first_name
    cr = CustomerRepository.new(fixtures_dir, sales_engine)
    cr.create_customers

    result = cr.find_all_by_first_name("Joey")
    assert_equal 1, result.count
  end

  def test_it_can_find_all_customers_by_last_name
    cr = CustomerRepository.new(fixtures_dir, sales_engine)
    cr.create_customers

    result = cr.find_all_by_last_name("Ondricka")
    assert_equal 1, result.count
  end

  def test_it_can_find_all_customers_by_created_at
    cr = CustomerRepository.new(fixtures_dir, sales_engine)
    cr.create_customers

    result = cr.find_all_by_created_at("2012-03-27 14:54:09 UTC")
    assert_equal 1, result.count
  end

  def test_it_can_find_all_customers_by_updated_at
    cr = CustomerRepository.new(fixtures_dir, sales_engine)
    cr.create_customers

    result = cr.find_all_by_updated_at("2012-03-27 14:54:09 UTC")
    assert_equal 1, result.count
  end

end
