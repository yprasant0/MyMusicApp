class Artistsearch

  include HTTParty
  API_KEY = "1ca2cf614eeaa185c2b61753b434b599"
  base_uri "http://ws.audioscrobbler.com/2.0/"
  JSON_FORMAT = 'json'

  default_params api_key: API_KEY, format: JSON_FORMAT

  def self.get_artist_tracks(search_query)

    default_params method: 'artist.gettoptracks'
    @top_tracks_response =  get("", query: {artist: search_query})

    if @top_tracks_response['toptracks'].blank?
      return nil
    else
      @topTracks =@top_tracks_response['toptracks']['track']
    end

  end

  def self.get_similar_artist(search_query)

    default_params method: 'artist.getsimilar'
    @similar_artist_response =  get('', query: {artist: search_query})
    if @similar_artist_response['similarartists'].nil?
      return nil
    else
      @similar_artist = @similar_artist_response['similarartists']['artist']
    end

  end



end
