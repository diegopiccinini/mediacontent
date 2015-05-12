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

    visit content_path(Content.first.slug)
    html.should include("Video MongoDB") 
    html.should have_css("a", :text => "Edit")
    html.should have_css("a", :text => "Back")

    logout(:user)
    visit content_path(Content.first.slug)
    html.should include("Video MongoDB") 
    html.should_not have_css("a", :text => "Edit")
    html.should have_css("a", :text => "Back")
    
  end
  it "should have an iframe content" do

    visit new_content_path


    within "#new_content" do
      fill_in "content_name", with: "Video MongoDB"
      find('select#content_content_type').find("option[value='video']").select_option     
      fill_in "content_content", with: "<iframe width=\"420\" height=\"315\" src=\"https://www.youtube.com/embed/rRpSgv1JyOo\" frameborder=\"0\" allowfullscreen></iframe>"
      check "content_published"
      
    end

    click_link_or_button "Create Content"


    logout(:user)
    visit content_path(Content.first.slug)
    html.should include("Video MongoDB") 
    html.should include("<iframe width=\"420\" height=\"315\" src=\"https://www.youtube.com/embed/rRpSgv1JyOo\" frameborder=\"0\" allowfullscreen></iframe>") 

    
  end
  context "when publish a image " do
    it "should have an img tag" do

      visit new_content_path

      within "#new_content" do
        fill_in "content_name", with: "Green Image"
        find('select#content_content_type').find("option[value='image']").select_option     
        fill_in "content_content", with: "MyText"
        attach_file('content_image', File.join(Rails.root, 'spec', 'support', 'contents', 'images', 'geen.jpg'))
        check "content_published"
        
      end

      click_link_or_button "Create Content"


      logout(:user)
      visit content_path(Content.first.slug)
      html.should include("Green Image")  
      find(:xpath, "//img/@src").text.should has_text? "geen.jpg"
    end
  end
  context "when publish a link" do 
    it "should have a link" do

      visit new_content_path

      within "#new_content" do
        fill_in "content_name", with: "Google Link"
        find('select#content_content_type').find("option[value='link']").select_option     
        fill_in "content_content", with: "<a href=\"https://www.google.es\">Google</a>"
      
        check "content_published"
        
      end

      click_link_or_button "Create Content"


      logout(:user)
      visit content_path(Content.first.slug)
      html.should include("Google Link")  
      html.should include("<a href=\"https://www.google.es\">Google</a>") 
    end
  end
end
