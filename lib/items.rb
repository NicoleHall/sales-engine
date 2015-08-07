class Items
  attr_reader :id, :name, :created_at, :updated_at
  #  :item_repo

# add item_repo to initialize and the readers
  def initialize(id, name, created_at, updated_at)
    @id         = id.to_i
    @name       = name
    @created_at = created_at
    @updated_at = updated_at
    # @item_repo = item_repo
  end
end


# Date.parse(created_at)
# Date.parse(updated_at)
