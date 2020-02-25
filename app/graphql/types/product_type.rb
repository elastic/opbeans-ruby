module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: false
    field :sku, String, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :cost, Integer, null: false
    field :selling_price, Integer, null: false

    field :product_kind, ProductKindType, null: false
  end
end
