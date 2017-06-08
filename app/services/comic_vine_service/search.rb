module ComicVineService
  class Search

    def initialize(query, resources='volume')
      @query = query
      @resources = resources
    end

    def results
      do_search.map{|vol| ComicVineService::VolumeResult.new(vol)}
    end

    private

    def do_search
      ComicVine::API.search @resources, @query
    end
  end
end
