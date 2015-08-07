require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sales_engine'
require 'pry'

class SeTest < Minitest::Test
  def data_dir
    File.expand_path "#{__dir__}/../data"
  end

  def fixtures_dir
    File.expand_path "#{__dir__}/../fixtures"
  end
end
