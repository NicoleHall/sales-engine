require_relative 'customers'
require_relative 'fileio'

class CustomerLoader

  attr_reader :customers, :customer_repository

  def initialize(dir, customer_repository)
    @customers           = []
    @dir                 = dir
    @customer_repository = customer_repository
  end

  def data
    FileIO.load_file("#{@dir}/customers.csv")
  end

  def load_customers
    data.each do |row|
      @customers << Customer.new(row[:id], row[:first_name], row[:last_name], row[:created_at], row[:updated_at], customer_repository)
    end
    @customers
  end
end
