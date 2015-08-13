require_relative '../lib/sales_engine'
require_relative "../lib/invoices"
require_relative "../lib/items"
require_relative '../lib/invoice_items'
require_relative '../lib/merchants'
require_relative "../lib/customers.rb"
require_relative '../lib/transactions'
require_relative '../lib/transaction_repository.rb'
require_relative '../lib/merchant_repository'
require_relative '../lib/item_repository'
require_relative '../lib/invoice_repository'
require_relative '../lib/invoice_item_repository.rb'
require_relative '../lib/customer_repository.rb'
require_relative '../lib/customer_loader'
require 'bigdecimal'
require 'pry'

class SeTest < Minitest::Test
  def data_dir
    File.expand_path "#{__dir__}/../data"
  end

  def fixtures_dir
    File.expand_path "#{__dir__}/../fixtures"
  end
end
