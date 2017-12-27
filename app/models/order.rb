class Order < ApplicationRecord
  belongs_to :customer

  def customer_name
    customer.full_name
  end

  def as_json(opts = {})
    super opts.reverse_merge(
      methods: %i[customer_name]
    )
  end
end
