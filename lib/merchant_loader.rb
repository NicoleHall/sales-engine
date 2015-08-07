require_relative 'merchant'
require_relative 'fileio'

class MerchantLoader

#pass in merchant repo into intiialize which becaomes the reader which accesses self on the other end
# add the reader merchant_repo
# and # @merchant_repo = merchant_repo into initialize
  attr_reader :merchants

  def initialize(dir)
    @merchants = []
    @dir       = dir
  end

  def data
    FileIO.load_file("#{@dir}/merchants.csv")
  end

# add the argument merchant_repo to the Merchant object
  def load_merchants
    data.each do |row|
      @merchants << Merchant.new(row[:id], row[:name], row[:created_at], row[:updated_at])
    end
    @merchants
  end
end
