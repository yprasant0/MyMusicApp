class SearchController < ApplicationController
  before_action :require_login

  def action

    query = params[:q]
    #the instance variable for storing the toptracks info from the api call
    @topTracks = Artistsearch.get_artist_tracks(query)
    #the instance variable for storing the similar artist info from the api call
    @similar_artist = Artistsearch.get_similar_artist(query)

    create_history

  end

  #function to store queries in the serach table

  def create_history
    if (signed_in? && !params[:q].blank?)
      user = User.find(current_user.id)
      puts current_user.id
      user.searches.create( user_id: user.id,searches: params[:q])
    end
  end
end


