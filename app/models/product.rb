class Product < ApplicationRecord
  belongs_to :product_kind
  has_many :order_lines
  has_many :orders, through: :order_lines
  has_many :customers, through: :orders

  def type_name
    product_kind.name
  end

  def as_json(opts = {})
    super opts.reverse_merge(
      methods: %i[type_name]
    )
  end
end
