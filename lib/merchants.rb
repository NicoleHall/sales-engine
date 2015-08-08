class Merchants
  attr_reader :id, :name, :created_at, :updated_at, :repository

  def initialize(id, name, created_at, updated_at, repository)
    @id         = id.to_i
    @name       = name
    @created_at = created_at
    @updated_at = updated_at
    @repository = repository
  end
  def items
    repository.sales_engine.item_repository.find_all_by_merchant_id(id)
  end

  def invoices
    repository.sales_engine.invoice_repository.find_all_by_merchant_id(id)
  end

end



# Date.parse(created_at)
# Date.parse(updated_at)
