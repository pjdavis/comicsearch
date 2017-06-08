module ComicVineService
  class Search

    def initialize(query, resources='volumes')
      @query = query
      @resources = resources
    end

    def results
      do_search.map{|vol| ComicVineService::Volume.new(vol)}
    end

    private

    def do_search
      ComicVine::API.search @resources, @query
    end
  end
end
