require_relative 'customers'
require_relative 'fileio'

class CustomerLoader

#pass in customer repo into intiialize which becaomes the reader which accesses self on the other end
# add the reader customer_repo
# and # @customer_repo = customer_repo into initialize
  attr_reader :customers

  def initialize(dir)
    @customers = []
    @dir       = dir
  end

  def data
    FileIO.load_file("#{@dir}/customers.csv")
  end

# add the argument customer_repo to the Customer object
  def load_customers
    data.each do |row|
      @customers << Customer.new(row[:id], row[:first_name], row[:last_name], row[:created_at], row[:updated_at])
    end
    @customers
  end
end
