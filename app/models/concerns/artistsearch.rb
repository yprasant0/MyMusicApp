class Artistsearch
  # using httparty for fetching json
  include HTTParty
  # the parameters needed for httparty to get the json file
  API_KEY = "1ca2cf614eeaa185c2b61753b434b599"
  JSON_FORMAT = 'json'
  base_uri "http://ws.audioscrobbler.com/2.0/"
  #default params of the httparty
  default_params api_key: API_KEY, format: JSON_FORMAT
  #function for fetching the top artist track
  def self.get_artist_tracks(search_query)
    # api's method to fetch toptracks of the artist
    default_params method: 'artist.gettoptracks'

    @top_tracks_response = get("", query: {artist: search_query})

    if !@top_tracks_response['error'].nil?
      return nil
    else
      @topTracks = @top_tracks_response['toptracks']['track']

    end
  end
# method for obtaining the similar artist track
  def self.get_similar_artist(search_query)
    #api_method to fetch the data
    default_params method: 'artist.getsimilar'
    @similar_artist_response = get('', query: {artist: search_query})
    if @similar_artist_response['similarartists'].nil?
      return nil
    else
      @similar_artist = @similar_artist_response['similarartists']['artist']
    end

  end


end
