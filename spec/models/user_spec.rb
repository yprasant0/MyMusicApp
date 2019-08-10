require 'rails_helper'
require 'spec_helper'
require 'support/factory_bot'

def create_user(email, password)
  FactoryBot.create(:user, email: email, password: password)
end

RSpec.describe User, :type => :model do

  #test the user table entries
  it "is valid with valid attributes" do
    user1 = create_user("test1@gmail.com", "cat")
    expect(user1).to be_valid
  end
end
