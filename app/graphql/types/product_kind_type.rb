module Types
  class ProductKindType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false

    field :products, [ProductType], null: true
  end
end
