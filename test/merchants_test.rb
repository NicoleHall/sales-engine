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

  def test_it_finds_invoices_for_a_merchant
    result = merchant_repository.merchants[7].invoices
    result2 = result.map do |invoice|
                        invoice.id
                      end
    assert_equal [2], result2[0..3]
    assert_equal 3, result[0].customer_id
  end

  def test_we_can_find_transactions_for_all_invoices_for_a_merchant
    transactions = merchant_repository.merchants[0].transactions
    result2 = transactions.map do |transaction|
                        transaction.id
                      end
    assert_equal [1 ,2, 3, 4, 5, 6, 7], result2[0..8]
  end

  def test_we_can_get_just_the_successful_transactions
    successful_trans = merchant_repository.merchants[0].successful_transactions
    result2 = successful_trans.map do |transaction|
                        transaction.id
                      end
    assert_equal [1 ,2, 4, 6], result2[0..8]
  end

  def test_we_can_get_just_invoices_with_successful_transaction
    successful_transactions = merchant_repository.merchants[0].invoices_for_successful_transactions
    result2 = successful_transactions.map do |invoice|
                        invoice.id
                      end
    assert_equal [1, 2, 5, 7] ,result2
  end

  def test_we_can_find_paid_invoice_items_for_a_merchant
    merchant = merchant_repository.merchants[0]
    invoice_items = merchant.paid_invoice_items

    assert_equal 12, invoice_items.count
  end

  def test_revenue_for_a_merchant
    sales_eng = SalesEngine.new(data_dir)
    merchant_repository = MerchantRepository.new(data_dir, sales_eng)
    merchant = merchant_repository.merchants[0]

    assert_equal 528774.64, merchant.revenue
  end

  def test_get_successful_merchant_invoice_for_a_specific_date
    merchant = merchant_repository.merchants[0]
    invoice = merchant.successful_invoice_by_date("2012-03-25 09:54:09 UTC")

    assert_equal 1, invoice.id
  end

  def test_get_paid_invoices_items_by_invoice_date_created_at
    sales_eng = SalesEngine.new(data_dir)
    merchant_repository = MerchantRepository.new(data_dir, sales_eng)
    merchant = merchant_repository.merchants[0]
    invoice_items = merchant.paid_invoice_items_by_date("2012-03-27 14:54:09 UTC")

    assert_equal 4, invoice_items.count
  end

  def test_revenue_for_a_merchant_by_invoice_date
    sales_eng = SalesEngine.new(data_dir)
    merchant_repository = MerchantRepository.new(data_dir, sales_eng)
    merchant = merchant_repository.merchants[0]
    result = merchant.revenue_by_date("2012-03-25 09:54:09 UTC")
    assert_equal 21067.77, result
  end


  def test_we_find_the_customer_id_for_the_most_successful_transactions
    merchant = merchant_repository.merchants[0]
    result = merchant.favorite_customer_id
    assert_equal 1, result
  end

  def test_we_can_find_the_customer_with_the_most_transactions
    merchant = merchant_repository.merchants[0]
    result = merchant.favorite_customer

    assert_equal 1, result.id
  end

  def test_we_can_find_invoices_for_unsuccessful_transactions
    unsuccessful_transactions = merchant_repository.merchants[0].invoices_for_unsuccessful_transactions
    result2 = unsuccessful_transactions.map do |invoice|
                        invoice.id
                      end
    assert_equal [1, 2, 5, 7] ,result2
  end

  def test_we_can_find_customers_with_pending_transactions
    skip
    merchant = merchant_repository.merchants[0]
    result = merchant.customers_with_pending_invoices

    assert_equal 3, result.size
  end

  def test_we_can_calculate_items_sold_for_a_merchant
    result = merchant_repository.merchants[0].merchant_items_sold

    assert_equal 67, result
  end

end
