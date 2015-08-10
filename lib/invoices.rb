class Invoices

  attr_reader :id, :customer_id, :merchant_id, :status, :created_at,
              :updated_at, :invoice_repository

  def initialize(id, customer_id, merchant_id, status, created_at,
                updated_at, invoice_repository)
    @id                 = id.to_i
    @customer_id        = customer_id.to_i
    @merchant_id        = merchant_id.to_i
    @status             = status
    @created_at         = created_at
    @updated_at         = updated_at
    @invoice_repository = invoice_repository
  end

  def merchant
    invoice_repository.sales_engine.find_merchant_for_an_invoice(merchant_id)
  end

  def customer
    invoice_repository.sales_engine.find_customer_for_an_invoice(customer_id)
  end

  def transactions
    invoice_repository.sales_engine.find_transactions_for_an_invoice(id)
  end

  def invoice_items
    invoice_repository.sales_engine.find_invoice_items_for_an_invoice(id)
  end

  def items
  array = []
  invoice_items.each do |invoice_item|
    x = invoice_item.item_id
    array << invoice_item.invoice_item_repository.sales_engine.find_item_for_invoice_item_by_item_id(x)
    end
    array
  #   invoice_repository.sales_engine.find_items_by_way_of_invoice_items(id)
  end

end
