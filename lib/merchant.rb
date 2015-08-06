class Merchant
  attr_reader :id, :name, :created_at, :updated_at

  def initialize(id, name, created_at, updated_at)
    @id = id.to_i
    @name = name
    @created_at = created_at
    @updated_at = updated_at
  end
end
