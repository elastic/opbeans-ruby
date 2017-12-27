module Api
  class BaseController < ApplicationController
    protect_from_forgery only: []
  end
end
