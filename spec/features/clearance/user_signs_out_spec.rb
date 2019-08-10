require "rails_helper"
require "support/features/clearance_helpers"

RSpec.feature "User signs out" do
  before do
    VCR.turn_off!
    WebMock.allow_net_connect!
  end
  scenario "signs out" do
    sign_in
    sign_out

    expect_user_to_be_signed_out
  end
end
