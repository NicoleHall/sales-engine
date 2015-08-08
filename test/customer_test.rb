require_relative 'test_helper'
require_relative "../lib/sales_engine"
require_relative "../lib/customers.rb"

class CustomersTest < SeTest

  def test_it_has_a_class
    assert Customer
  end

end
