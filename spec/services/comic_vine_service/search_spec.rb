require 'rails_helper'

RSpec.describe ComicVineService::Search do

  context 'when doing a search' do

    context 'and an API error occurs' do

      before(:each) do
        stub_request(:get, /comicvine/).
          with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
          to_return(status: 200, body: {status_code: 104, error: "Filter Error"}.to_json, headers: {})
      end

      it 'throws an error' do
        expect { ComicVineService::Search.new('error').results }.to raise_error ComicVine::CVError
      end
    end

    context 'and the request is successful' do

      before(:each) do
        stub_request(:get, /comicvine/).
          with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
          to_return(status: 200, body: {
            status_code: 1,
            number_of_total_results: 2,
            number_of_page_results: 2,
            results: [{
              aliases: "aliases 1",
              count_of_issues: 1,
              name: "volume 1",
              description: "description of volume one",
              id: 1,
              date_added: "2013-12-14 19:15:18",
              date_last_updated: "2013-12-14 19:15:18",
              start_year: 2001
            },{
              aliases: "aliases 2",
              count_of_issues: 1,
              name: "volume 2",
              description: "description of volume two",
              id: 2,
              date_added: "2013-12-14 19:15:18",
              date_last_updated: "2013-12-14 19:15:18",
              start_year: 2001
            }]
          }.to_json, headers: {})
      end

      it 'returns a list of matches' do
        results = ComicVineService::Search.new('batman').results
        expect(results.size).to eql(2)
      end
    end
  end
end
