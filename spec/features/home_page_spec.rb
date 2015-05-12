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
    html.should have_css("a", :text => "Login")
  end
  it "should include a search form " do

    visit root_path

    html.should include("<form")
    html.should have_selector(:link_or_button, 'Search')
    html.should have_field('text_searched')
  end
  context "Search a content that not exists" do
    it "should include a search form " do
      visit root_path
      within "form" do
        fill_in "text_searched", with: "Google Link"
      end
      click_link_or_button 'Search' 
      html.should_not include("Google Link")
    end
  end

end
