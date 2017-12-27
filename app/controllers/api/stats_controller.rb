module Api
  class StatsController < BaseController
    def index
      render json: {
        products: Product.count,
        customer: Customer.count,
        orders: Order.count,
        numbers: {revenue: 0, cost: 0, profit: 0}
      }
    end
  end
end
