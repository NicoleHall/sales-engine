require_relative 'test_helper.rb'
require_relative '../lib/invoice_repository.rb'
#the tests that look for fixtures data go here

class InvoiceRepositoryTest < SeTest

  def test_has_a_class
    assert InvoiceRepository
  end

  def test_it_can_find_all
    ir = InvoiceRepository.new(fixtures_dir)

    assert_equal 9, ir.all.size
  end

  def test_it_can_return_a_random_invoice_instance
     skip
     ########  !!!!!!!!  Unskip this before assessment, it works
    ir= InvoiceRepository.new(fixtures_dir)
    ir1 = ir.random
    ir2 = ir.random
    ir3 = ir.random

    refute_equal ir1, ir2
    refute_equal ir1, ir3
    refute_equal ir2, ir3
  end

  def test_it_can_find_matching_invoice_by_id
    ir = InvoiceRepository.new(fixtures_dir)

    result = ir.find_invoice_by_id(5)
    assert_equal 5, result.id
  end

  def test_it_can_find_by_customer_id
    ir = InvoiceRepository.new(fixtures_dir)
    result = ir.find_invoice_by_customer_id("1")

    assert_equal "1", result.customer_id
  end

  def test_it_can_find_invoice_by_merchant_id
    ir = InvoiceRepository.new(fixtures_dir)
    result = ir.find_invoice_by_merchant_id("26")

    assert_equal "26", result.merchant_id
  end

  def test_it_can_find_by_status
    ir = InvoiceRepository.new(fixtures_dir)
    result = ir.find_invoice_by_status("shipped")

    assert_equal "shipped", result.status
  end

  def test_it_can_find_by_date_created_at
    ir = InvoiceRepository.new(fixtures_dir)
    result = ir.find_invoice_by_created_at("2012-03-25 09:54:09 UTC")

    assert_equal 1, result.id
    assert_equal "2012-03-25 09:54:09 UTC", result.created_at
  end

  def test_it_can_find_by_date_updated_at
    ir = InvoiceRepository.new(fixtures_dir)
    result = ir.find_invoice_by_updated_at("2012-03-07 19:54:10 UTC")

    assert_equal "2012-03-07 19:54:10 UTC", result.updated_at
    assert_equal 5, result.id
  end

  def test_it_can_find_all_invoices_by_id
    ir = InvoiceRepository.new(fixtures_dir)
    result = ir.find_all_invoices_by_id(5)

    assert_equal 5, result[0].id
  end

  def test_it_can_find_all_invoices_by_customer_id
    ir = InvoiceRepository.new(fixtures_dir)
    result = ir.find_all_invoices_by_customer_id("1")

    assert_equal 8, result.count
  end

  def test_it_can_find_all_invoices_by_merchant_id
    ir = InvoiceRepository.new(fixtures_dir)
    result = ir.find_all_invoices_by_merchant_id("27")

    assert_equal 1, result.count
  end

  def test_it_can_find_all_invoices_by_status
    ir = InvoiceRepository.new(fixtures_dir)
    result = ir.find_all_invoices_by_status("shipped")

    assert_equal 9, result.count
  end

  def test_it_can_find_all_invoices_by_created_at
    ir = InvoiceRepository.new(fixtures_dir)

    result = ir.find_all_invoices_by_created_at("2012-03-25 09:54:09 UTC")
    assert_equal 1, result.count
  end

  def test_it_can_find_all_invoices_by_updated_at
    ir = InvoiceRepository.new(fixtures_dir)

    result = ir.find_all_invoices_by_updated_at("2012-03-25 09:54:09 UTC")
    assert_equal 1, result.count
  end

end
