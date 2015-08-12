require 'test_helper'

class InvoiceTest < SeTest

  attr_reader :merchant_repository, :sales_engine, :item_repository,
              :invoice_repository

  def setup
    @sales_engine = SalesEngine.new(fixtures_dir)
    @merchant_repository = MerchantRepository.new(fixtures_dir, sales_engine)
    @item_repository = ItemRepository.new(fixtures_dir, sales_engine)
    @invoice_repository = InvoiceRepository.new(fixtures_dir, sales_engine)
  end

  def test_can_return_a_merchant_for_an_invoice
    result = invoice_repository.invoices[10].merchant

    assert_equal "Osinski, Pollich and Koelpin", result.name
  end

  def test_can_return_a_customer_for_an_invoice
    result = invoice_repository.invoices[10].customer

    assert_equal "Mariah", result.first_name
  end

  def test_it_can_return_all_transactions_for_an_invoice
    result = invoice_repository.invoices[0].transactions
    result2 = result.map do |item|
                      item.id
                      end
    assert_equal [1], result2[0..3]
    assert_equal 4654405418249632, result[0].credit_card_number
  end

  def test_it_can_return_all_transactions_for_an_invoice
    result = invoice_repository.invoices[0].transactions
    result2 = result.map do |item|
                      item.id
                      end
    assert_equal [1], result2[0..3]
    assert_equal 4654405418249632, result[0].credit_card_number
  end


  def test_it_can_retun_a_collection_of_invoice_items_by_invoice_id
    result = invoice_repository.invoices[1].invoice_items
    result2 = result.map do |invoice_item|
                      invoice_item.id
                    end
    assert_equal [9, 10, 11, 12], result2[0..3]
    assert_equal 6, result[0].quantity
  end

  def test_it_can_retun_a_collection_of_items_for_a_invoice
    result = invoice_repository.invoices[1].invoice_items
    result2 = result.map do |invoice_item|
                      invoice_item.id
                    end
    assert_equal [9, 10, 11, 12], result2[0..3]
    result3 = result.map do |invoice_item|
                      invoice_item.item_id
                    end
    assert_equal [1832, 3, 2, 1], result3
    result4 = invoice_repository.invoices[1].items
    # binding.pry

    assert_equal 1832, result4[0].id
    result5 = result4.map do |item|
                      item.name
                    end
    assert_equal ["Item Provident At", "Item Ea Voluptatum", "Item Autem Minima", "Item Qui Esse"], result5[0..3]
  end

end
# 2,Item Autem Minima,Cumque consequuntur ad. Fuga tenetur illo molestias enim aut iste. Provident quo hic aut. Aut quidem voluptates dolores. Dolorem quae ab alias tempora.,67076,1,2012-03-27 14:53:59 UTC,2012-03-27 14:53:59 UTC
