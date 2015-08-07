require_relative 'item_loader'

class ItemRepository

  attr_reader :items, :dir, :sales_engine
  def initialize(dir)
    @items = []
    @dir       = dir
    @sales_engine = sales_engine
  end

  def create_items
    @items = ItemLoader.new(dir).load_items
  end

  def all
    items
  end

  def random
    items.sample
  end

  def find_by(attribute, search_criteria)
    items.detect do |item|
      item.send(attribute) == search_criteria
    end
  end

  def find_by_id(id)
    find_by(:id, id)
  end

  def find_by_name(name)
    find_by(:name, name)
  end

  def find_by_created_date(created_at)
    find_by(:created_at, created_at)
  end

  def find_by_updated_date(updated_at)
    find_by(:updated_at, updated_at)
  end

  def find_by_description(description)
    find_by(:description, description)
  end

  def find_all_by(attribute, search_criteria)
    array = []
    items.each do |item|
      array << item if item.send(attribute) == search_criteria
    end
    array
  end

  def find_all_by_id(id) ## why does this exist?
    find_all_by(:id, id)
  end

  def find_all_by_name(name)
    find_all_by(:name, name)
  end

  def find_all_by_created_at(created_at)
    find_all_by(:created_at, created_at)
  end

  def find_all_by_updated_at(updated_at)
    find_all_by(:updated_at, updated_at)
  end

  # def item(item_id)
  #   SalesEngine.item_repository
  # end
end
