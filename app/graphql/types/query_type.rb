module Types
  class QueryType < Types::BaseObject
    field :products, [ProductType], null: false

    field :product_kinds, [ProductKindType], null: false

    field :product_kind, ProductKindType, null: false do
      argument :id, ID, required: true
    end

    def products
      Product.all
    end

    def product_kinds
      ProductKind.all
    end

    def product_kind(id:)
      ProductKind.find(id)
    end
  end
end
