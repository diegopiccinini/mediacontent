require 'rails_helper'

RSpec.feature "ShowContentLinks", type: :feature do
	 before :each do
    @user = FactoryGirl.create(:user)
    login_as @user
   end
  it "should create a new content with a logged in user" do

    visit new_content_path


    within "#new_content" do
      fill_in "content_name", with: "Video MongoDB"
      find('select#content_content_type').find("option[value='video']").select_option 		
		  fill_in "content_content", with: "<iframe width=\"420\" height=\"315\" src=\"https://www.youtube.com/embed/rRpSgv1JyOo\" frameborder=\"0\" allowfullscreen></iframe>"
	    check "content_published"
      
    end

    click_link_or_button "Create Content"

    visit content_path
    html.should include("Video MongoDB")
    html.should have_css("a", :text => "Show")
    html.should have_css("a", :text => "Edit")
    html.should have_css("a", :text => "Back")

    logout(:user)
    visit content_path
 
    html.should include("Video MongoDB")
    html.should have_css("a", :text => "Show")
    html.should_not have_css("a", :text => "Edit")
    html.should have_css("a", :text => "Back")
    
  end


end
