require 'test_helper'
require_relative '../lib/invoice_repository'
require_relative '../lib/sales_engine'

class InvoiceRepositoryTest < SeTest
  attr_reader :invoice_repository, :sales_engine

  def setup
    @sales_engine = SalesEngine.new(fixtures_dir)
    @invoice_repository = InvoiceRepository.new(fixtures_dir, sales_engine)
  end

  def test_has_a_class
    assert InvoiceRepository
  end

  def test_it_can_find_all
    invoices = invoice_repository.all
    assert_equal 11, invoices.size
  end

  def test_it_can_return_a_random_merchant_instance
    skip   ########  !!!!!!!!  Unskip this before assessment, it works
    invoice_repository = InvoiceRepository.new(fixtures_dir, sales_engine)
    invoice1 = invoice_repository.random
    invoice2 = invoice_repository.random
    invoice3 = invoice_repository.random

    refute_equal invoice1, invoice2
    refute_equal invoice1, invoice3
    refute_equal invoice2, invoice3
  end

  def test_it_can_find_invoice_by_id
    invoice_repository = InvoiceRepository.new(fixtures_dir, sales_engine)

    result = invoice_repository.find_by_id(5)
    assert_equal 5, result.id
  end

  def test_it_can_find_invoice_by_customer_id
    invoice_repository = InvoiceRepository.new(fixtures_dir, sales_engine)

    result = invoice_repository.find_by_customer_id(2)
    assert_equal 9, result.id
  end

  def test_it_can_find_by_merchant_id
    invoice_repository = InvoiceRepository.new(fixtures_dir, sales_engine)
    result = invoice_repository.find_by_merchant_id(44)

    assert_equal 7, result.id
  end

  def test_it_can_find_by_status
    invoice_repository = InvoiceRepository.new(fixtures_dir, sales_engine)
    result = invoice_repository.find_by_status("shipped")

    assert_equal 26, result.merchant_id
  end

  def test_it_can_find_by_date_created_at
    invoice_repository = InvoiceRepository.new(fixtures_dir, sales_engine)
    result = invoice_repository.find_by_created_at("2012-03-12 05:54:09 UTC")

    assert_equal 2, result.id
  end

  def test_it_can_find_by_date_updated_at
    invoice_repository = InvoiceRepository.new(fixtures_dir, sales_engine)
    result = invoice_repository.find_by_updated_at("2012-03-12 05:54:09 UTC")

    assert_equal 75, result.merchant_id
    assert_equal 2, result.id
  end

  def test_it_can_find_all_invoices_by_id
    ### why is this method ?
    invoice_repository = InvoiceRepository.new(fixtures_dir, sales_engine)

    result = invoice_repository.find_all_by_id(5)
    assert_equal 5, result[0].id
  end

  def test_it_can_find_all_invoices_by_customer_id
    invoice_repository = InvoiceRepository.new(fixtures_dir, sales_engine)

    result = invoice_repository.find_all_by_customer_id(1)
    assert_equal 8, result.count
  end

  def test_it_can_find_all_invoices_by_merchant_id
    invoice_repository = InvoiceRepository.new(fixtures_dir, sales_engine)

    result = invoice_repository.find_all_by_merchant_id(26)
    assert_equal 1, result.count
  end

  def test_it_can_find_all_invoices_by_status
    invoice_repository = InvoiceRepository.new(fixtures_dir, sales_engine)

    result = invoice_repository.find_all_by_status("shipped")
    assert_equal 11, result.count
  end

  def test_it_can_find_all_invoices_by_created_at
    invoice_repository = InvoiceRepository.new(fixtures_dir, sales_engine)

    result = invoice_repository.find_all_by_created_at("2012-03-07 21:54:10 UTC")
    assert_equal 1, result.count
  end

  def test_it_can_find_all_invoices_by_updated_at
    invoice_repository = InvoiceRepository.new(fixtures_dir, sales_engine)

    result = invoice_repository.find_all_by_updated_at("2012-03-06 21:54:10 UTC")
    assert_equal 1, result.count
  end

  def test_it_can_find_invoices_assocaite_to_a_merchant
      invoice_repo = InvoiceRepository.new(fixtures_dir, sales_engine)

      result = invoice_repo.find_all_by_merchant_id(38)
      assert_equal 8, result[0].id
  end

end
