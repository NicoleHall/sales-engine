require_relative 'merchant_loader'

class MerchantRepository
  attr_reader :merchants
  def initialize
    @merchants
  end

  def create_merchants
    @merchants = MerchantLoader.new.load_merchants
  end
end
