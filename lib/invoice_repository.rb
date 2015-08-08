require_relative 'invoice_loader'

class InvoiceRepository

  ### change everything

  attr_reader :invoices, :dir
  def initialize(dir)
    @invoices = []
    @dir          = dir
    create_invoices
  end

  def create_invoices
    @invoices = InvoiceLoader.new(dir).load_invoices
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

  def find_invoice_by_id(id)
    find_by(:id, id)
  end

  def find_invoice_by_customer_id(customer_id)
    find_by(:customer_id, customer_id)
  end

  def find_invoice_by_merchant_id(merchant_id)
    find_by(:merchant_id, merchant_id)
  end

  def find_invoice_by_status(status)
    find_by(:status, status)
  end

  def find_invoice_by_created_at(created_at)
    find_by(:created_at, created_at)
  end

  def find_invoice_by_updated_at(updated_at)
    find_by(:updated_at, updated_at)
  end

  def find_all_by(attribute, search_criteria)
    array = []
    invoices.each do |invoice|
      array << invoice if invoice.send(attribute) == search_criteria
    end
    array
  end

  def find_all_invoices_by_id(id) ## why does this exist?
    find_all_by(:id, id)
  end

  def find_all_invoices_by_id(id)
    find_all_by(:id, id)
  end

  def find_all_invoices_by_customer_id(customer_id)
    find_all_by(:customer_id, customer_id)
  end

  def find_all_invoices_by_merchant_id(merchant_id)
    find_all_by(:merchant_id, merchant_id)
  end

  def find_all_invoices_by_status(status)
    find_all_by(:status, status)
  end

  def find_all_invoices_by_created_at(created_at)
    find_all_by(:created_at, created_at)
  end

  def find_all_invoices_by_updated_at(updated_at)
    find_all_by(:updated_at, updated_at)
  end

end
