require_relative 'customer_loader'

class CustomerRepository

  attr_reader :customers, :dir, :sales_engine
  def initialize(dir, sales_engine)
    @customers    = []
    @dir          = dir
    @sales_engine = sales_engine
    create_customers
  end

  def inspect
    "#<#{self.class} #{self.id}>"
  end

  def create_customers
    @customers = CustomerLoader.new(dir, self).load_customers
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

  def find_by_id(id)
    find_by(:id, id)
  end

  def find_by_first_name(first_name)
    find_by(:first_name, first_name)
  end

  def find_by_last_name(last_name)
    find_by(:last_name, last_name)
  end

  def find_by_created_date(created_at)
    find_by(:created_at, created_at)
  end

  def find_by_updated_date(updated_at)
    find_by(:updated_at, updated_at)
  end

  def find_all_by(attribute, search_criteria)
    customers.select {|item| item.send(attribute) == search_criteria }
  end

  def find_all_by_id(id) ## why does this exist?
    find_all_by(:id, id)
  end

  def find_all_by_first_name(first_name)
    find_all_by(:first_name, first_name)
  end

  def find_all_by_last_name(last_name)
    find_all_by(:last_name, last_name)
  end

  def find_all_by_created_at(created_at)
    find_all_by(:created_at, created_at)
  end

  def find_all_by_updated_at(updated_at)
    find_all_by(:updated_at, updated_at)
  end

end
