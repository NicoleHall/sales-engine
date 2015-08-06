require_relative 'merchant_loader'

class MerchantRepository

  attr_reader :merchants
  def initialize(dir)
    @merchants = []
    @dir       = dir
  end

  def create_merchants
    @merchants = MerchantLoader.new(@dir).load_merchants
  end
end

data_dir = File.expand_path "#{__dir__}/../data"
mr = MerchantRepository.new(data_dir)
mr.create_merchants[0]
# => #<Merchant:0x007fe3da0ebc10
#     @created_at="2012-03-27 14:53:59 UTC",
#     @id="1",
#     @name="Schroeder-Jerde",
#     @updated_at="2012-03-27 14:53:59 UTC">
