require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  #to turn on external api request
  before do
    VCR.turn_off!
    WebMock.allow_net_connect!
  end
  #method for creating user
  def create_user(email, password)
    FactoryBot.create(:user, email: email, password: password)
  end

  describe "GET #action" do
    it "checks topTracks in action search controller " do
      user1 = create_user("test1@gmail.com", "password1")
      # user signed in
      sign_in_as(user1)
      #fetches topTracks info
      test = Artistsearch.get_artist_tracks("Lady gaga")
      #stubbing parameters to controller method
      params = ActionController::Parameters.new(q: "Lady gaga")
      allow(controller).to receive(:params).and_return(params)

      get :action

      expect(assigns(:topTracks)).to eq(test)
    end
    it "renders the action template" do
      user2 = create_user("test2@gmail.com", "password2")
      sign_in_as(user2)
      #signed as user
      get :action
      expect(response).to render_template("action")
    end
  end
  describe "GET #action" do
    it "validation of similar_artist " do
      user3 = create_user("test3@gmail.com", "password3")
      #signed as user3
      sign_in_as(user3)
      #similar artist info
      test1 = Artistsearch.get_similar_artist("Lady gaga")
      #stubbing query
      params = ActionController::Parameters.new(q: "Lady gaga")

      allow(controller).to receive(:params).and_return(params)

      get :action

      expect(assigns(:similar_artist)).to eq(test1)
    end
    it "renders the actitemplate" do
      user4 = create_user("test5@gmail.com", "password5")
      #signed as user4
      sign_in_as(user4)
      get :action
      expect(response).to render_template("action")
    end
  end
end
