require 'test_helper'

class TransactionTest < SeTest

  attr_reader :transaction_repository, :sales_engine

  def setup
    @sales_engine = SalesEngine.new(fixtures_dir)
    @transaction_repository = TransactionRepository.new(fixtures_dir, sales_engine)
  end

  def test_it_has_a_class
    assert Transactions
  end

  def test_it_can_return_an_invoice_for_a_transaction
    result = transaction_repository.transactions[0].invoice
    assert_equal 1, result.merchant_id
  end

  def test_we_can_test_a_successful_transaction
    result = transaction_repository.transactions[0].successful?
    result1 = transaction_repository.transactions[2].successful?

    assert  result
    refute result1
  end

end
