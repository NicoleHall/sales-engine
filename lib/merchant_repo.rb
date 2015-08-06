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

  def all
    merchants
  end

  def random
    merchants.sample
  end

  def find_by_id(id)
    merchants.detect do |item|
      item.id == id
    end
  end

  def find_all_by_id(id)
    array = []
    merchants.each do |merchant|
      array << merchant if merchant.id == id
    end
    array
  end
end
