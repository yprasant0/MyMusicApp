require 'rails_helper'
require 'spec_helper'

describe Artistsearch do

  describe '.get_artist_tracks' do
    #turning off external api
    before do
      VCR.use_cassette 'storage/response' do
        @response = Artistsearch.get_artist_tracks("cher")
      end
    end
    # valiadate response
    it 'validate api response to get_artist_track' do
      expect(@response).to be_instance_of(Array)
    end
  end

  describe '.get_similar_artist' do

    before do
      VCR.use_cassette 'storage1/response1' do
        @response2 = Artistsearch.get_similar_artist("cher")
      end
    end
    # validate the api response
    it 'validate api response to get_similar_artist ' do
      expect(@response2).to be_instance_of(Array)
    end
  end
end

