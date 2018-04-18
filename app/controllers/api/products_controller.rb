module Api
  class ProductsController < BaseController
    def index
      products = Product.includes(:product_kind).all
      render json: products
    end

    def show
      product = Product.find params[:id]
      render json: product
    end

    def top
      products = Product.first(3)
      render json: products
    end
  end
end
