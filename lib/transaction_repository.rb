require_relative 'transaction_loader'

class TransactionRepository

  attr_reader :transactions, :dir, :sales_engine
  def initialize(dir, sales_engine)
    @transactions = []
    @dir          = dir
    @sales_engine = sales_engine
    create_transactions
  end

  def inspect
    "#<#{self.class} #{self.id}>"
  end

  def create_transactions
    @transactions = TransactionLoader.new(dir, self).load_transactions
  end

  def all
    transactions
  end

  def random
    transactions.sample
  end

  def find_by(attribute, search_criteria)
    transactions.detect do |item|
      item.send(attribute) == search_criteria
    end
  end

  def find_by_id(id)
    find_by(:id, id)
  end

  def find_by_invoice_id(invoice_id)
    find_by(:invoice_id, invoice_id)
  end

  def find_by_credit_card_number(credit_card_number)

    find_by(:credit_card_number, credit_card_number.to_i)
  end

  def find_by_result(result)
    find_by(:result, result)
  end

  def find_by_created_at(created_at)
    find_by(:created_at, created_at)
  end

  def find_by_updated_at(updated_at)
    find_by(:updated_at, updated_at)
  end

  def find_all_by(attribute, search_criteria)
    transactions.select {|item| item.send(attribute) == search_criteria }
  end

  def find_all_by_id(id) ## why does this exist?
    find_all_by(:id, id)
  end

  def find_all_by_invoice_id(invoice_id)
    find_all_by(:invoice_id, invoice_id)
  end

  def find_all_by_credit_card_number(credit_card_number)
    find_all_by(:credit_card_number, credit_card_number)
  end

  def find_all_by_result(result)
    find_all_by(:result, result)
  end

  def find_all_by_created_at(created_at)
    find_all_by(:created_at, created_at)
  end

  def find_all_by_updated_at(updated_at)
    find_all_by(:updated_at, updated_at)
  end

end
