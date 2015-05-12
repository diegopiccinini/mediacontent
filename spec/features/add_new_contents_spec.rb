require 'rails_helper'

RSpec.feature "AddNewContents", type: :feature do
	 before do
    @user = FactoryGirl.create(:user)
    login_as @user
   end
  it "should create a new content with a logged in user" do

    visit new_content_path
    # puts page.body

    within "#new_content" do
      fill_in "content_name", with: "Video MongoDB"
      find('select#content_content_type').find("option[value='video']").select_option 		
		  fill_in "content_content", with: "<iframe width=\"420\" height=\"315\" src=\"https://www.youtube.com/embed/rRpSgv1JyOo\" frameborder=\"0\" allowfullscreen></iframe>"
	    check "content_published"
      
    end

    click_link_or_button "Create Content"

    expect( Content.count ).to eq(1)
    expect( Content.first.name).to eq("Video MongoDB")
    expect( Content.first.content_type).to eq("video")
    expect( Content.first.content).to eq("<iframe width=\"420\" height=\"315\" src=\"https://www.youtube.com/embed/rRpSgv1JyOo\" frameborder=\"0\" allowfullscreen></iframe>")
    expect( Content.first.published).to eq(true)
    expect( Content.first.user_id).to eq(@user.id)

  end
end
