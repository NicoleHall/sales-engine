class Items
  attr_reader :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at, :repository
  #  :item_repo

# add item_repo to initialize and the readers
  def initialize(id, name, description, unit_price, merchant_id, created_at, updated_at, repository)
    @id             = id.to_i
    @name           = name
    @description    = description
    @unit_price     = unit_price.to_i
    @merchant_id    = merchant_id.to_i
    @created_at     = created_at
    @updated_at     = updated_at
    @repository     = repository
  end

  def inspect
    "#<#{self.class} #{self.id}>"
  end

  def invoice_items
    repository.sales_engine.find_invoice_items_by_item_id(id)
  end

  def merchant
    repository.sales_engine.find_merchant_for_item(merchant_id)
  end

end

# repository.sales_engine.find_invoices_for_transactions(invoice_id)

# Date.parse(created_at)
# Date.parse(updated_at)
