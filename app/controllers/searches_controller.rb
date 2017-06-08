class SearchesController < ApplicationController

  def index
    @searches = Search.past_searches
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.new(search_params)
    if @search.save
      redirect_to @search
    else
      render :new
    end
  end

  def show
    @search = Search.find(params[:id])
    @results = ComicVineService::Search.new(@search.term).results
  end

  private

  def search_params
    params.require(:search).permit(:term)
  end

end
