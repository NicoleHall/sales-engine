require 'test_helper'
require_relative '../lib/item_repo'

#the tests that look for fixtures data go here

class ItemRepositoryTest < SeTest

  def test_has_a_class
    assert ItemRepository
  end

  def test_it_can_find_all
    ir = ItemRepository.new(fixtures_dir)
    ir.create_items
    assert_equal 10, ir.all.size
  end

  def test_it_can_return_a_random_item_instance
      ########  !!!!!!!!  Unskip this before assessment, it works
    skip
    ir = ItemRepository.new(fixtures_dir)
    ir.create_items
    ir1 = ir.random
    ir2 = ir.random
    ir3 = ir.random

    refute_equal ir1, ir2
    refute_equal ir1, ir3
    refute_equal ir2, ir3
  end

  def test_it_can_find_matching_item_by_id
    ir = ItemRepository.new(fixtures_dir)
    ir.create_items

    result = ir.find_item_by_id(5)
    assert_equal 5, result.id
  end

  def test_it_can_find_by_name
    ir = ItemRepository.new(fixtures_dir)
    ir.create_items
    result = ir.find_item_by_name("Item Qui Esse")

    assert_equal "Item Qui Esse", result.name
    ### is this not an array of results?  can I not call count on it?
  end

  def test_it_can_find_by_date_created_at
    ir = ItemRepository.new(fixtures_dir)
    ir.create_items
    result = ir.find_item_by_created_date("2012-03-27 14:53:59 UTC")

    assert_equal 1, result.id
    assert_equal "2012-03-27 14:53:59 UTC", result.created_at
  end

  def test_it_can_find_by_date_updated_at
    ir = ItemRepository.new(fixtures_dir)
    ir.create_items
    result = ir.find_item_by_updated_date("2012-03-27 14:53:59 UTC")

    assert_equal "2012-03-27 14:53:59 UTC", result.updated_at
    assert_equal 1, result.id
  end

  def test_it_can_find_all_items_by_id
    ### why is this method ?
    ir = ItemRepository.new(fixtures_dir)
    ir.create_items

    result = ir.find_all_items_by_id(5)
    assert_equal 5, result[0].id
  end

  def test_it_can_find_all_items_by_name
    ir = ItemRepository.new(fixtures_dir)
    ir.create_items

    result = ir.find_all_items_by_name("Item Qui Esse")
    assert_equal 1, result.count
  end

  def test_it_can_find_all_items_by_created_at
    ir = ItemRepository.new(fixtures_dir)
    ir.create_items

    result = ir.find_all_items_by_created_at("2012-03-27 14:53:59 UTC")
    assert_equal 10, result.count
  end

  def test_it_can_find_all_items_by_updated_at
    ir = ItemRepository.new(fixtures_dir)
    ir.create_items

    result = ir.find_all_items_by_updated_at("2012-03-27 14:53:59 UTC")
    assert_equal 10, result.count
  end

end
