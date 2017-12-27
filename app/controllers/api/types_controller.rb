module Api
  class TypesController < BaseController
    def index
      render json: ProductKind.all
    end

    def show
      render json: ProductKind.find(params[:id])
    end
  end
end
