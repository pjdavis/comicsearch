class QueriesController < ApplicationController

  def index
    @queries = Query.past_searches
  end

  def new
    @query = Query.new
  end

  def create
    @query = Query.find_by(term: params[:query][:term]) ||  Query.new(query_params)
    @query.searches.build
    if @query.save
      redirect_to @query
    else
      render :new
    end
  end

  def show
    @query = Query.find(params[:id])
    @searches = @query.searches
    @results = ComicVineService::Search.new(@query.term).results
  end

  private

  def query_params
    params.require(:query).permit(:term)
  end

end
