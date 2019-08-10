require 'rails_helper'

RSpec.describe HistoryController, type: :controller do

  describe "GET #show_search_history" do
    it "returns http success" do

      get :show_search_history

      expect(response).to have_http_status(:success)
    end
  end

end
