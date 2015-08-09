require 'test_helper'

class TransactionTest < SeTest

  attr_reader :transaction_repository, :sales_engine, :invoice_repository

  def setup
    @sales_engine = SalesEngine.new(fixtures_dir)
    @transaction_repository = TransactionRepository.new(fixtures_dir, sales_engine)
    @invoice_repository = InvoiceRepository.new(fixtures_dir, sales_engine)
  end

  def test_it_has_a_class
    assert Transactions
  end

  def test_it_can_access_invoices_for_a_transaction
    result = transaction_repository.transactions[0].invoices
    result2 = result.map do |invoice|
                      invoice.id
                      end
    assert_equal [1], result2[0..3]
    assert_equal 26, result[0].merchant_id
  end

end
