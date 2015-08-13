require_relative 'items'
require_relative 'fileio'

class ItemLoader

  attr_reader :items, :item_repository

  def initialize(dir, item_repository)
    @items           = []
    @dir             = dir
    @item_repository = item_repository
  end

  def data
    FileIO.load_file("#{@dir}/items.csv")
  end

  def load_items
    data.each do |row|
      @items << Items.new(row[:id], row[:name], row[:description],
                          row[:unit_price], row[:merchant_id], row[:created_at],
                          row[:updated_at], item_repository)
    end
    @items
  end

end
