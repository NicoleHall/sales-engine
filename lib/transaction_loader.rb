require_relative 'transactions'
require_relative 'fileio'

class TransactionLoader

  #pass in transaction repo into intiialize which becaomes the reader which accesses self on the other end
  # add the reader transaction repository
  # and # @transaction_repository = transaction_repository into initialize
  attr_reader :transactions

  def initialize(dir)
    @transactions = []
    @dir          = dir
  end

  def data
    FileIO.load_file("#{@dir}/transactions.csv")
  end

  # add the argument transaction_repository to the Transaction object
  def load_transactions
    data.each do |row|
      @transactions << Transactions.new(row[:id], row[:invoice_id], row[:credit_card_number], row[:credit_card_expiration_date], row[:result], row[:created_at], row[:updated_at])
    end
    @transactions
  end
end
