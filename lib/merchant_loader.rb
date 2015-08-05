require_relative 'merchants'
require_relative 'fileio'

class MerchantLoader

  attr_reader :merchants

  def initialize
    @merchants = []
  end

  def data
    FileIO.load_file("merchants.csv")
  end

  def load_merchants
    data.each do |row|
      @merchants << Merchant.new(row[:id], row[:name], row[:created_at], row[:updated_at])
    end
    @merchants
  end
end
