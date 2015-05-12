require 'rails_helper'

RSpec.feature "HomePage", type: :feature do

  it "should view contents#index" do

    visit root_path

    html.should include("Welcome to media contents")

  end
  it "should not include without media " do

    visit root_path

    html.should_not include("<table>")

  end
  it "should not include without media " do

    visit root_path

    html.should_not include("<table>")

  end
end
