require_relative 'merchant_loader'

class MerchantRepository

  attr_reader :merchants, :dir
  def initialize(dir)
    @merchants = []
    @dir       = dir
  end

  def create_merchants
    @merchants = MerchantLoader.new(dir).load_merchants
  end

  def all
    merchants
  end

  def random
    merchants.sample
  end

  def find_by(attribute, search_criteria)
    merchants.detect do |item|
      item.send(attribute) == search_criteria
    end
  end

  def find_merchant_by_id(id)
    find_by(:id, id)
  end

  def find_merchant_by_name(name)
    find_by(:name, name)
  end

  def find_merchant_by_created_date(created_at)
    find_by(:created_at, created_at)
  end

  def find_merchant_by_updated_date(updated_at)
    find_by(:updated_at, updated_at)
  end

  def find_all_merchants_by_id(id) ## why does this exist?
    array = []
    merchants.each do |merchant|
      array << merchant if merchant.id == id
    end
    array
  end

  def find_all_merchants_by_name(name)
    array = []
    merchants.each do |merchant|
      array << merchant if merchant.name == name
    end
    array
  end

  def find_all_merchants_by_created_at(created_at)
    array = []
    merchants.each do |merchant|
      array << merchant if merchant.created_at == created_at
    end
    array
  end

  def find_all_merchants_by_updated_at(updated_at)
    array = []
    merchants.each do |merchant|
      array << merchant if merchant.updated_at == updated_at
    end
    array
  end

end
