require 'rails_helper'
require 'spec_helper'
require 'support/factory_bot'
# function for creating user
def create_user(email, password)
  FactoryBot.create(:user, email: email, password: password)
end

RSpec.describe Search, :type => :model do

  # test the search table entries
  it "is invalid with blank search attributes" do
    user1 = create_user("t1@gmail.com", "password6")
    user1.searches.create( user_id: "1",searches: nil)
    expect(user1).to_not be_valid
  end
  it "has valid attributes" do
    user2 = create_user("t2@gmail.com", "password7")
    user2.searches.create( user_id: "12" ,searches: "shreya")
    expect(user2).to be_valid
  end
  it "has invalid attributes with nil user_id" do
    user3 = create_user("t3@gmail.com", "password8")
    user3.searches.create( user_id: nil ,searches: "shreya")
    expect(user3).to_not be_valid
  end

end




