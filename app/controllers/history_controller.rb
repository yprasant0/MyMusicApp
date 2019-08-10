class HistoryController < ApplicationController
  #function to show previous searched history
  def show_search_history
    if signed_in?
      # gets the user_id according to the current user's ID created
      user = User.find(current_user.id)
      #queries from the Database
      @user_searches = user.searches.order('created_at DESC').group_by {|c| c.created_at.to_date}
    end
  end
end
