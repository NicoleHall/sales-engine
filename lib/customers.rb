class Customer
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at, :customer_repository

# add customer_repo to initialize and the readers
  def initialize(id, first_name, last_name, created_at, updated_at, customer_repository)
    @id = id.to_i
    @first_name = first_name#.downcase
    @last_name  = last_name#.downcase
    @created_at = created_at
    @updated_at = updated_at
    @customer_repository = customer_repository
  end
end
