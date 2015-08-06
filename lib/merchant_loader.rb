require_relative 'merchant'
require_relative 'fileio'

class MerchantLoader

  attr_reader :merchants

  def initialize(dir)
    @merchants = []
    @dir       = dir
  end

  def data
    FileIO.load_file("#{@dir}/fixture_merchant.csv")
  end

  def load_merchants
    data.each do |row|
      @merchants << Merchant.new(row[:id], row[:name], row[:created_at], row[:updated_at])
    end
    @merchants
  end
end
