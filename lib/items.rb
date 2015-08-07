class Items
  attr_reader :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at
  #  :item_repo

# add item_repo to initialize and the readers
  def initialize(id, name, description, unit_price, merchant_id, created_at, updated_at)
    @id             = id.to_i
    @name           = name
    @description    = description
    @unit_price     = unit_price
    @merchant_id    = merchant_id
    @created_at     = created_at
    @updated_at     = updated_at
    # @item_repo = item_repo
  end
end


# Date.parse(created_at)
# Date.parse(updated_at)
