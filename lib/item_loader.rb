require_relative 'items'
require_relative 'fileio'

class ItemLoader

#pass in merchant repo into intiialize which becaomes the reader which accesses self on the other end
# add the reader merchant_repo
# and # @merchant_repo = merchant_repo into initialize
  attr_reader :items, :item_repository

  def initialize(dir, item_repository)
    @items           = []
    @dir             = dir
    @item_repository = item_repository
  end

  def data
    FileIO.load_file("#{@dir}/items.csv")
  end

# add the argument merchant_repo to the Merchant object
  def load_items
    data.each do |row|
      @items << Items.new(row[:id], row[:name], row[:description], row[:unit_price], row[:merchant_id], row[:created_at], row[:updated_at], item_repository)
    end
    @items
  end

end
