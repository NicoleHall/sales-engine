require_relative 'merchant_loader'  # => true

class MerchantRepository

  attr_reader :merchants  # => nil
  def initialize(dir)
    @merchants = []       # => []
    @dir       = dir      # => "/Users/justinpease/Turing_All/Module_1.2/Projects/sales-engine/data"
  end                     # => :initialize

  def create_merchants
    @merchants = MerchantLoader.new(@dir).load_merchants  # => [#<Merchant:0x007f8d288a07e8 @id="1", @name="Schroeder-Jerde", @created_at="2012-03-27 14:53:59 UTC", @updated_at="2012-03-27 14:53:59 UTC">, #<Merchant:0x007f8d2889bf90 @id="2", @name="Klein, Rempel and Jones", @created_at="2012-03-27 14:53:59 UTC", @updated_at="2012-03-27 14:53:59 UTC">, #<Merchant:0x007f8d2889b680 @id="3", @name="Willms and Sons", @created_at="2012-03-27 14:53:59 UTC", @updated_at="2012-03-27 14:53:59 UTC">, #<Merchant:0x007f8d2889ae10 @id="4", @name="Cummings-Thiel", @created_at="2012-03-27 14:53:59 UTC", @updated_at="2012-03-27 14:53:59 UTC">, #<Merchant:0x007f8d2889a4d8 @id="5", @name="Williamson Group", @created_at="2012-03-27 14:53:59 UTC", @updated_at="2012-03-27 14:53:59 UTC">, #<Merchant:0x007f8d28899df8 @id="6", @name="Williamson Group", @created_at="2012-03-27 14:53:59 UTC", @updated_at="2012-03-27 16:12:25 UTC">, #<Merchant:0x007f8d28899790 @id="7", @name="Bernhard-Johns", @created_at="2012...
  end                                                     # => :create_merchants

  def all
    merchants
 end            # => :all

 def random
   all.sample
 end           # => :random

 def find_by_id(id)
   merchants.detect do |item|
      item.id == id
   end
 end                            # => :find_by_id

 def find_all_by_id(id)
   array = []
   merchants.each do |merchant|
     array << merchant if merchant.id == id
   end
   array
 end                                         # => :find_all_by_id
end                                          # => :find_all_by_id

# -------------------------------------------
data_dir = File.expand_path "#{__dir__}/../data"  # => "/Users/justinpease/Turing_All/Module_1.2/Projects/sales-engine/data"
mr = MerchantRepository.new(data_dir)             # => #<MerchantRepository:0x007f8d288a8448 @merchants=[], @dir="/Users/justinpease/Turing_All/Module_1.2/Projects/sales-engine/data">
mr.create_merchants                               # => [#<Merchant:0x007f8d288a07e8 @id="1", @name="Schroeder-Jerde", @created_at="2012-03-27 14:53:59 UTC", @updated_at="2012-03-27 14:53:59 UTC">, #<Merchant:0x007f8d2889bf90 @id="2", @name="Klein, Rempel and Jones", @created_at="2012-03-27 14:53:59 UTC", @updated_at="2012-03-27 14:53:59 UTC">, #<Merchant:0x007f8d2889b680 @id="3", @name="Willms and Sons", @created_at="2012-03-27 14:53:59 UTC", @updated_at="2012-03-27 14:53:59 UTC">, #<Merchant:0x007f8d2889ae10 @id="4", @name="Cummings-Thiel", @created_at="2012-03-27 14:53:59 UTC", @updated_at="2012-03-27 14:53:59 UTC">, #<Merchant:0x007f8d2889a4d8 @id="5", @name="Williamson Group", @created_at="2012-03-27 14:53:59 UTC", @updated_at="2012-03-27 14:53:59 UTC">, #<Merchant:0x007f8d28899df8 @id="6", @name="Williamson Group", @created_at="2012-03-27 14:53:59 UTC", @updated_at="2012-03-27 16:12:25 UTC">, #<Merchant:0x007f8d28899790 @id="7", @name="Bernhard-Johns", @created_at="2012-03-27 1...
mr.merchants                                      # => [#<Merchant:0x007f8d288a07e8 @id="1", @name="Schroeder-Jerde", @created_at="2012-03-27 14:53:59 UTC", @updated_at="2012-03-27 14:53:59 UTC">, #<Merchant:0x007f8d2889bf90 @id="2", @name="Klein, Rempel and Jones", @created_at="2012-03-27 14:53:59 UTC", @updated_at="2012-03-27 14:53:59 UTC">, #<Merchant:0x007f8d2889b680 @id="3", @name="Willms and Sons", @created_at="2012-03-27 14:53:59 UTC", @updated_at="2012-03-27 14:53:59 UTC">, #<Merchant:0x007f8d2889ae10 @id="4", @name="Cummings-Thiel", @created_at="2012-03-27 14:53:59 UTC", @updated_at="2012-03-27 14:53:59 UTC">, #<Merchant:0x007f8d2889a4d8 @id="5", @name="Williamson Group", @created_at="2012-03-27 14:53:59 UTC", @updated_at="2012-03-27 14:53:59 UTC">, #<Merchant:0x007f8d28899df8 @id="6", @name="Williamson Group", @created_at="2012-03-27 14:53:59 UTC", @updated_at="2012-03-27 16:12:25 UTC">, #<Merchant:0x007f8d28899790 @id="7", @name="Bernhard-Johns", @created_at="2012-03-27 1...
