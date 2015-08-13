require_relative 'merchants'
require_relative 'fileio'

class MerchantLoader

  attr_reader :merchants, :merchant_repository

  def initialize(dir, merchant_repository)
    @merchant_repository = merchant_repository
    @merchants = []
    @dir       = dir
  end

  def data
    FileIO.load_file("#{@dir}/merchants.csv")
  end

  def load_merchants
    data.each do |row|
      @merchants << Merchants.new(row[:id], row[:name], row[:created_at],
                                  row[:updated_at], merchant_repository)
    end
    @merchants
  end

end
