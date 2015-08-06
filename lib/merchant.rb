class Merchant
  attr_reader :id, :name, :created_at, :updated_at

  def initialize(id, name, created_at, updated_at)
    @id = id
    @name = name
    @created_at = created_at
    @updated_at = updated_at
  end
end











# se = SalesEngine.new
# se.load_data("fixtures.csv")
# puts se.merchant_repo.merchants.inspect
