class CoffeeController < ApplicationController
  def coffee_time
    if params[:level].to_i === 11
      render plain: 'Of course!'
    else
      render plain: "You can't have any!"
    end
  end
end
