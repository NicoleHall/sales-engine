require_relative 'merchant_repo'
class SalesEngine

  attr_reader :merchant_repo
  def initialize(dir="data")
    @merchant_repo = MerchantRepository.new(dir)
    @merchant_repo.create_merchants
  end
end
