module Api
  class CustomersController < BaseController
    def index
      base =
        if params[:product_id]
          Product.find(params[:product_id]).customers.distinct
        else
          Customer.all
        end

      render json: base
    end

    def show
      render json: Customer.find(params[:id])
    end
  end
end
