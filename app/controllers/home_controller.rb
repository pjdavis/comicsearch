class HomeController < ApplicationController

  def index
    @query = Query.new
    @queries = Query.past_searches.limit(5)
  end
end
