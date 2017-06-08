module ComicVineService
  class Volume

    attr_reader :aliases, :count_of_issues
    attr_reader :date_added, :date_last_updated, :description
    attr_reader :name, :start_year

    def initialize(id)
      volume = get_volume(id)
      %w(aliases count_of_issues date_added date_last_updated description name start_year).each do |attribute|
        self.instance_variable_set("@#{attribute}", volume.send(attribute.to_sym))
      end
    end

    private

    def get_volume(id)
      ComicVine::API.volume(id)
    end
  end
end
