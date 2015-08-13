require_relative 'transactions'
require_relative 'fileio'

class TransactionLoader

  attr_reader :transactions, :transaction_repository

  def initialize(dir, transaction_repository)
    @transactions           = []
    @dir                    = dir
    @transaction_repository = transaction_repository
  end

  def data
    FileIO.load_file("#{@dir}/transactions.csv")
  end

  def load_transactions
    data.each do |row|
      @transactions << Transactions.new(row[:id], row[:invoice_id],
      row[:credit_card_number], row[:credit_card_expiration_date], row[:result],
      row[:created_at], row[:updated_at], transaction_repository)
    end
    @transactions
  end
end
