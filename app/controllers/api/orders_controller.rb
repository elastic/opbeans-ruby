module Api
  class OrdersController < BaseController
    def index
      render json: Order.all
    end

    def create
      customer = Customer.find params[:customer_id]

      order = Order.transaction do
        order = customer.orders.create!
        params[:lines].each do |line|
          OrderLine.create! product_id: line[:id], amount: line[:amount], order: order
        end

        order
      end

      render json: {id: order.id}
    end

    def show
      render json: Order.find(params[:id])
    end
  end
end
