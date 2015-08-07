require_relative 'customer_loader'

class CustomerRepository

  attr_reader :customers, :dir
  def initialize(dir)
    @customers = []
    @dir       = dir
  end

  def create_customers
    @customers = CustomerLoader.new(dir).load_customers
  end

  def all
    customers
  end

  def random
    customers.sample
  end

  def find_by(attribute, search_criteria)
    customers.detect do |item|
      item.send(attribute) == search_criteria
    end
  end

  def find_customer_by_id(id)
    find_by(:id, id)
  end

  def find_customer_by_first_name(first_name)
    find_by(:first_name, first_name)
  end

  def find_customer_by_last_name(last_name)
    find_by(:last_name, last_name)
  end

  def find_customer_by_created_date(created_at)
    find_by(:created_at, created_at)
  end

  def find_customer_by_updated_date(updated_at)
    find_by(:updated_at, updated_at)
  end

  def find_all_by(attribute, search_criteria)
    array = []
    customers.each do |customer|
      array << customer if customer.send(attribute) == search_criteria
    end
    array
  end

  def find_all_customers_by_id(id) ## why does this exist?
    find_all_by(:id, id)
  end

  def find_all_customers_by_first_name(first_name)
    find_all_by(:first_name, first_name)
  end

  def find_all_customers_by_last_name(last_name)
    find_all_by(:last_name, last_name)
  end

  def find_all_customers_by_created_at(created_at)
    find_all_by(:created_at, created_at)
  end

  def find_all_customers_by_updated_at(updated_at)
    find_all_by(:updated_at, updated_at)
  end

  end
