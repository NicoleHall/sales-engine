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
    merchant = merchant_repository.merchants[0]

    assert_equal 24813.25, BigDecimal.new(merchant.revenue) / 100
  end

end
