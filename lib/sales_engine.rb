require_relative 'merchant_repo'
require_relative 'item_repo'
class SalesEngine

  attr_reader :merchant_repository
  def initialize(dir="data")
    @merchant_repository = MerchantRepository.new(dir)
    @merchant_repository.create_merchants
  end
end
