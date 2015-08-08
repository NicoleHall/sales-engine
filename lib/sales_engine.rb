require_relative 'merchant_repo'
require_relative 'item_repo'
require 'pry'
class SalesEngine

  attr_reader :merchant_repository, :item_repository
  def initialize(dir="data")
    @item_repository = ItemRepository.new(dir, self)
    @merchant_repository = MerchantRepository.new(dir, self)
    @merchant_repository.create_merchants
  end

  def find_items_by_merchant_id(id)
    item_repository.find_all_by_merchant_id(id) ###this is getting teh wrong stuff, its finding the tiem id not the merchant id
  end

  # def merchant_invoices(merchant_id)

  # def merchant_item(attribute, search_criteria)
  #   merchant_repository.find_all_by(attribute, search_criteria)
  # end

  # def find_all_by(attribute, search_criteria)
  #   array = []
  #   merchants.each do |item|
  #     array << item if item.send(attribute) == search_criteria
  #   end
  #   array
  # end

end

if __FILE__ == $0
  engine = SalesEngine.new
  binding.pry
end
