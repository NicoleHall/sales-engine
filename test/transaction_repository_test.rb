require_relative 'test_helper.rb'
require_relative '../lib/transaction_repository.rb'
#the tests that look for fixtures data go here

class TransactionRepositoryTest < SeTest

  def test_has_a_class
    assert TransactionRepository
  end

  def test_it_can_find_all
    tr = TransactionRepository.new(fixtures_dir)

    assert_equal 11, tr.all.size
  end

  def test_it_can_return_a_random_transaction_instance
     skip
     ########  !!!!!!!!  Unskip this before assessment, it works
    tr= TransactionRepository.new(fixtures_dir)
    tr1 = tr.random
    tr2 = tr.random
    tr3 = tr.random

    refute_equal tr1, tr2
    refute_equal tr1, tr3
    refute_equal tr2, tr3
  end

  def test_it_can_find_matching_transaction_by_id
    tr = TransactionRepository.new(fixtures_dir)

    result = tr.find_transaction_by_id(5)
    assert_equal 5, result.id
  end

  def test_it_can_find_by_invoice_id
    tr = TransactionRepository.new(fixtures_dir)
    result = tr.find_transaction_by_invoice_id("1")

    assert_equal "1", result.invoice_id
  end

  def test_it_can_find_transaction_by_credit_card_number
    tr = TransactionRepository.new(fixtures_dir)
    result = tr.find_transaction_by_credit_card_number("4654405418249632")

    assert_equal "4654405418249632", result.credit_card_number
  end

  def test_it_can_find_by_result
    tr = TransactionRepository.new(fixtures_dir)
    result = tr.find_transaction_by_result("success")
    result2 = tr.find_transaction_by_result("failed")

    assert_equal "success", result.result
    assert_equal "failed", result2.result
  end

  def test_it_can_find_by_date_created_at
    tr = TransactionRepository.new(fixtures_dir)
    result = tr.find_transaction_by_created_at("2012-03-27 14:54:09 UTC")

    assert_equal 1, result.id
    assert_equal "2012-03-27 14:54:09 UTC", result.created_at
  end

  def test_it_can_find_by_date_updated_at
    tr = TransactionRepository.new(fixtures_dir)
    result = tr.find_transaction_by_updated_at("2012-03-27 14:54:09 UTC")

    assert_equal "2012-03-27 14:54:09 UTC", result.updated_at
    assert_equal 1, result.id
  end

  def test_it_can_find_all_transactions_by_id
    tr = TransactionRepository.new(fixtures_dir)
    result = tr.find_all_transactions_by_id(5)

    assert_equal 5, result[0].id
  end

  def test_it_can_find_all_transactions_by_invoice_id
    tr = TransactionRepository.new(fixtures_dir)
    result = tr.find_all_transactions_by_invoice_id("2")

    assert_equal 1, result.count
  end

  def test_it_can_find_all_transactions_by_credit_card_number
    tr = TransactionRepository.new(fixtures_dir)
    result = tr.find_all_transactions_by_credit_card_number("4654405418249632")

    assert_equal 1, result.count
  end

  def test_it_can_find_all_transactions_by_result
    tr = TransactionRepository.new(fixtures_dir)
    result = tr.find_all_transactions_by_result("failed")

    assert_equal 1, result.count
  end

  def test_it_can_find_all_transactions_by_created_at
    tr = TransactionRepository.new(fixtures_dir)

    result = tr.find_all_transactions_by_created_at("2012-03-27 14:54:13 UTC")
    assert_equal 1, result.count
  end

  def test_it_can_find_all_transactions_by_updated_at
    tr = TransactionRepository.new(fixtures_dir)

    result = tr.find_all_transactions_by_updated_at("2012-03-27 14:54:13 UTC")
    assert_equal 1, result.count
  end

end
