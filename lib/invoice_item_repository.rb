require_relative 'invoice_item_loader'

class InvoiceItemRepository

  attr_reader :invoice_items, :dir, :sales_engine
  def initialize(dir, sales_engine)
    @invoice_items = []
    @dir           = dir
    @sales_engine  = sales_engine
    create_invoice_items
  end

  def create_invoice_items
    @invoice_items = InvoiceItemLoader.new(dir, self).load_invoice_items
  end

  def all
    invoice_items
  end

  def random
    invoice_items.sample
  end

  def find_by(attribute, search_criteria)
    invoice_items.detect do |item|
      item.send(attribute) == search_criteria
    end
  end

  def find_invoice_item_by_id(id)
    find_by(:id, id)
  end

  def find_invoice_item_by_item_id(item_id)
    find_by(:item_id, item_id)
  end

  def find_invoice_item_by_invoice_id(invoice_id)
    find_by(:invoice_id, invoice_id)
  end

  def find_invoice_item_by_quantity(quantity)
    find_by(:quantity, quantity)
  end

  def find_invoice_item_by_unit_price(unit_price)
    find_by(:unit_price, unit_price)
  end

  def find_invoice_item_by_created_at(created_at)
    find_by(:created_at, created_at)
  end

  def find_invoice_item_by_updated_at(updated_at)
    find_by(:updated_at, updated_at)
  end

  def find_all_by(attribute, search_criteria)
    invoice_items.select {|item| item.send(attribute) == search_criteria }
  end

  def find_all_invoice_items_by_id(id)
    find_all_by(:id, id)
  end

  def find_all_invoice_items_by_item_id(item_id)
    find_all_by(:item_id, item_id)
  end

  def find_all_invoice_items_by_invoice_id(invoice_id)
    find_all_by(:invoice_id, invoice_id)
  end

  def find_all_invoice_items_by_quantity(quantity)
    find_all_by(:quantity, quantity)
  end

  def find_all_invoice_items_by_unit_price(unit_price)
    find_all_by(:unit_price, unit_price)
  end

  def find_all_invoice_items_by_created_at(created_at)
    find_all_by(:created_at, created_at)
  end

  def find_all_invoice_items_by_updated_at(updated_at)
    find_all_by(:updated_at, updated_at)
  end

end
