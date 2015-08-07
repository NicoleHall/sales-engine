class Merchants
  attr_reader :id, :name, :created_at, :updated_at
  #  :merchant_repo

# add merchant_repo to initialize and the readers
  def initialize(id, name, created_at, updated_at)
    @id         = id.to_i
    @name       = name
    @created_at = created_at
    @updated_at = updated_at
    # @merchant_repo = merchant_repo
  end
end


# Date.parse(created_at)
# Date.parse(updated_at)
