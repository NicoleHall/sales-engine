class InvoiceItems

  attr_reader :id,
              :item_id,
              :invoice_id,
              :quantity,
              :unit_price,
              :created_at,
              :updated_at
           #  :invoice_item_repository

# add invoice_item_repository to initialize and the readers
  def initialize(id,
                 item_id,
                 invoice_id,
                 quantity,
                 unit_price,
                 created_at,
   n               updated_at)
    @id = id.to_i
    @item_id = item_id
    @invoice_id = invoice_id
    @quantity = quantity
    @unit_price = unit_price.to_i
    @created_at = created_at# Date.parse(updated_at)
    @updated_at = updated_at# Date.parse(updated_at)
    # @invoice_item_repository = invoice_item_repository
  end
end
