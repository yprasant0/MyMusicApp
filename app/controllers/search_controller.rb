class SearchController < ApplicationController
  before_action :require_login

  def action

    query = params[:q]
    @topTracks = Artistsearch.get_artist_tracks(query)

    @similar_artist = Artistsearch.get_similar_artist(query)

    create_history

  end

    def show_search_history
        if signed_in?
          user = User.find(current_user.id)
          @user_searches = user.searches.order('created_at DESC').group_by { |c| c.created_at.to_date }
      end
    end

  def create_history
    if (signed_in? && !params[:q].blank?)
      user = User.find(current_user.id)
      puts current_user.id
      user.searches.create( user_id: user.id,searches: params[:q])
    end
  end
end


