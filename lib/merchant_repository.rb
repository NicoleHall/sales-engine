require_relative 'merchant_loader'

class MerchantRepository

  attr_reader :merchants, :dir, :sales_engine
  def initialize(dir, sales_engine)
    @merchants    = []
    @dir          = dir
    @sales_engine = sales_engine
    create_merchants
  end

  def inspect
    "#<#{self.class} #{self.id}>"
  end

  def create_merchants
    @merchants = MerchantLoader.new(dir, self).load_merchants
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

  def find_by_id(id)
    find_by(:id, id)
  end

  def find_by_name(name)
    find_by(:name, name)
  end

  def find_by_created_at(created_at)
    find_by(:created_at, created_at)
  end

  def find_by_updated_at(updated_at)
    find_by(:updated_at, updated_at)
  end

  def find_all_by(attribute, search_criteria)
    merchants.select {|item| item.send(attribute) == search_criteria }
  end

  def find_all_by_id(id) ## why does this exist?
    find_all_by(:id, id)
  end

  def find_all_by_name(name)
    find_all_by(:name, name)
  end

  def find_all_by_created_at(created_at)
    find_all_by(:created_at, created_at)
  end

  def find_all_by_updated_at(updated_at)
    find_all_by(:updated_at, updated_at)
  end

  def most_revenue(num)
    merchants.sort_by do |merchant|
      merchant.revenue if merchant.revenue
    end.reverse[0...num]
  end

  def most_items(x)
    merchants.sort_by do |merchant|
      merchant.merchant_items_sold
    end.reverse[0...x]
  end

  def revenue(date)
    merchants.map do |merchant|
      merchant.revenue(date)
    end.reduce(:+)
  end

end
