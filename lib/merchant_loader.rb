require_relative 'merchants'
require_relative 'fileio'

class MerchantLoader

#pass in merchant repo into intiialize which becaomes the reader which accesses self on the other end
# add the reader merchant_repo
# and # @merchant_repo = merchant_repo into initialize
  attr_reader :merchants, :merchant_repository

  def initialize(dir, merchant_repository)
    @merchant_repository = merchant_repository
    @merchants = []
    @dir       = dir
  end

  def data
    FileIO.load_file("#{@dir}/merchants.csv")
  end

# add the argument merchant_repo to the Merchant object
  def load_merchants
    data.each do |row|
      @merchants << Merchants.new(row[:id], row[:name], row[:created_at], row[:updated_at], merchant_repository)
    end
    @merchants
  end

end
