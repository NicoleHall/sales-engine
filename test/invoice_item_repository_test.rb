require_relative 'test_helper.rb'

class InvoiceItemRepositoryTest < SeTest

  attr_reader :merchant_repository, :sales_engine

  def setup
    @sales_engine = SalesEngine.new(fixtures_dir)
    @invoice_item_repository = InvoiceItemRepository.new(fixtures_dir, sales_engine)
  end

  def test_has_a_class
    assert InvoiceItemRepository
  end

  def test_it_can_find_all

    iir = InvoiceItemRepository.new(fixtures_dir, sales_engine)

    assert_equal 12, iir.all.size
  end

  def test_it_can_return_a_random_invoice_item_instance
      skip########  !!!!!!!!  Unskip this before assessment, it works
    iir= InvoiceItemRepository.new(fixtures_dir, sales_engine)
    iir1 = iir.random
    iir2 = iir.random
    iir3 = iir.random

    refute_equal iir1, iir2
    refute_equal iir1, iir3
    refute_equal iir2, iir3
  end

  def test_it_can_find_matching_invoice_item_by_id
    iir = InvoiceItemRepository.new(fixtures_dir, sales_engine)

    result = iir.find_invoice_item_by_id(1)
    assert_equal 1, result.id
  end

  def test_it_can_find_by_item_id
    iir = InvoiceItemRepository.new(fixtures_dir, sales_engine)
    result = iir.find_invoice_item_by_item_id(539)

    assert_equal 539, result.item_id
  end

  def test_it_can_find_invoice_item_by_invoice_id

    iir = InvoiceItemRepository.new(fixtures_dir, sales_engine)
    result = iir.find_invoice_item_by_invoice_id(1)

    assert_equal 1, result.invoice_id
  end

  def test_it_can_find_by_quantity
    iir = InvoiceItemRepository.new(fixtures_dir, sales_engine)
    result = iir.find_invoice_item_by_quantity(5)

    assert_equal 5, result.quantity
  end

  def test_it_can_find_by_unit_price
    iir = InvoiceItemRepository.new(fixtures_dir, sales_engine)
    result = iir.find_invoice_item_by_unit_price(13635)

    assert_equal 13635, result.unit_price
  end

  def test_it_can_find_by_date_created_at
    iir = InvoiceItemRepository.new(fixtures_dir, sales_engine)
    result = iir.find_invoice_item_by_created_at("2012-03-27 14:54:09 UTC")

    assert_equal 1, result.id
    assert_equal "2012-03-27 14:54:09 UTC", result.created_at
  end

  def test_it_can_find_by_date_updated_at
    iir = InvoiceItemRepository.new(fixtures_dir, sales_engine)
    result = iir.find_invoice_item_by_updated_at("2012-03-27 14:54:09 UTC")

    assert_equal "2012-03-27 14:54:09 UTC", result.updated_at
    assert_equal 1, result.id
  end

  def test_it_can_find_all_invoice_items_by_id
    iir = InvoiceItemRepository.new(fixtures_dir, sales_engine)
    result = iir.find_all_invoice_items_by_id(5)

    assert_equal 5, result[0].id
  end

  def test_it_can_find_all_invoice_items_by_item_id
    iir = InvoiceItemRepository.new(fixtures_dir, sales_engine)
    result = iir.find_all_invoice_items_by_item_id(2)

    assert_equal 2, result.count
  end

  def test_it_can_find_all_invoice_items_by_invoice_id
    iir = InvoiceItemRepository.new(fixtures_dir, sales_engine)
    result = iir.find_all_invoice_items_by_invoice_id(1)

    assert_equal 8, result.count
  end

  def test_it_can_find_all_invoice_items_by_quantity

    iir = InvoiceItemRepository.new(fixtures_dir, sales_engine)
    result = iir.find_all_invoice_items_by_quantity(5)

    assert_equal 2, result.count
  end

  def test_it_can_find_all_invoice_items_by_unit_price
    iir = InvoiceItemRepository.new(fixtures_dir, sales_engine)
    result = iir.find_all_invoice_items_by_unit_price(13635)

    assert_equal 1, result.count
  end

  def test_it_can_find_all_invoice_items_by_created_at
    iir = InvoiceItemRepository.new(fixtures_dir, sales_engine)

    result = iir.find_all_invoice_items_by_created_at("2012-03-27 14:54:09 UTC")
    assert_equal 10, result.count
  end

  def test_it_can_find_all_invoice_items_by_updated_at
    iir = InvoiceItemRepository.new(fixtures_dir, sales_engine)

    result = iir.find_all_invoice_items_by_updated_at("2012-03-27 14:54:09 UTC")
    assert_equal 12, result.count
  end

end
