require_relative 'invoice_loader'

class InvoiceRepository

  attr_reader :invoices, :dir, :sales_engine
  def initialize(dir, sales_engine)
    @invoices = []
    @dir          = dir
    @sales_engine = sales_engine
    create_invoices
  end

  def create_invoices
    @invoices = InvoiceLoader.new(dir, self).load_invoices
  end

  def all
    invoices
  end

  def random
    invoices.sample
  end

  def find_by(attribute, search_criteria)
    invoices.detect do |item|
      item.send(attribute) == search_criteria
    end
  end

  def find_by_id(id)
    find_by(:id, id)
  end

  def find_by_customer_id(customer_id)
    find_by(:customer_id, customer_id)
  end

  def find_by_merchant_id(merchant_id)
    find_by(:merchant_id, merchant_id)
  end

  def find_by_status(status)
    find_by(:status, status)
  end

  def find_by_created_at(created_at)
    find_by(:created_at, created_at)
  end

  def find_by_updated_at(updated_at)
    find_by(:updated_at, updated_at)
  end

  def find_all_by(attribute, search_criteria)
    invoices.select {|item| item.send(attribute) == search_criteria }
  end

  def find_all_by_id(id) ## why does this exist?
    find_all_by(:id, id)
  end

  def find_all_by_customer_id(customer_id)
    find_all_by(:customer_id, customer_id)
  end

  def find_all_by_merchant_id(merchant_id)
    find_all_by(:merchant_id, merchant_id)
  end

  def find_all_by_status(status)
    find_all_by(:status, status)
  end

  def find_all_by_created_at(created_at)
    find_all_by(:created_at, created_at)
  end

  def find_all_by_updated_at(updated_at)
    find_all_by(:updated_at, updated_at)
  end

end
