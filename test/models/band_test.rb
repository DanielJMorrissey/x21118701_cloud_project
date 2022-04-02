require "test_helper"

class BandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
=begin
  test "Band Insert" do

    visit "/newbands"

    fill_in "name", with: "Dan the man"
    fill_in "country", with: "Ireland"
    fill_in "members", with: 5
    fill_in "genre", with: "punk"

    click_on "/newbands"

    expect("/newbands").to have_css('#flash', text: "Band Saved")
  end
  =end
end
