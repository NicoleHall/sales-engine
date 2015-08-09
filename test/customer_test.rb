require_relative 'test_helper'

class CustomersTest < SeTest

  attr_reader :customer_repository, :sales_engine, :invoice_repository

  def setup
    @sales_engine = SalesEngine.new(fixtures_dir)
    @customer_repository = CustomerRepository.new(fixtures_dir, sales_engine)
    @invoice_repository = InvoiceRepository.new(fixtures_dir, sales_engine)
  end

  def test_it_has_a_class
    assert Customer
  end

  def test_it_can_access_invoices_for_a_customer
    result = customer_repository.customers[0].invoices
    result2 = result.map do |invoice|
                      invoice.id
                      end
    assert_equal [1,2,3,4], result2[0..3]
    assert_equal 1, result[3].customer_id
  end

end
