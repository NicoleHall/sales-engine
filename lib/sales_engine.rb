require_relative 'merchant_repo'  # => true

class SalesEngine
  attr_reader :merchant_rep  # => nil

  def initialize
    @merchant_rep = MerchantRepository.new.create_merchants
  end

end




se = SalesEngine.new

# ~> Errno::ENOENT
# ~> No such file or directory @ rb_sysopen - merchants.csv
# ~>
# ~> /Users/FatMac/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/CSV.rb:1256:in `initialize'
# ~> /Users/FatMac/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/CSV.rb:1256:in `open'
# ~> /Users/FatMac/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/CSV.rb:1256:in `open'
# ~> /Users/FatMac/turing/module_one/sales_engine/lib/fileio.rb:5:in `load_file'
# ~> /Users/FatMac/turing/module_one/sales_engine/lib/merchant_loader.rb:13:in `data'
# ~> /Users/FatMac/turing/module_one/sales_engine/lib/merchant_loader.rb:17:in `load_merchants'
# ~> /Users/FatMac/turing/module_one/sales_engine/lib/merchant_repo.rb:10:in `create_merchants'
# ~> /Users/FatMac/turing/module_one/sales_engine/lib/sales_engine.rb:7:in `initialize'
# ~> /Users/FatMac/turing/module_one/sales_engine/lib/sales_engine.rb:15:in `new'
# ~> /Users/FatMac/turing/module_one/sales_engine/lib/sales_engine.rb:15:in `<main>'
