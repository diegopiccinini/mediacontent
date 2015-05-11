require 'rails_helper'

RSpec.feature "AddEditContents", type: :feature do
	 before do
    @user = FactoryGirl.create(:user)
    login_as @user
    @content= FactoryGirl.create(:content)
    @content.user_id=@user.id
    @content.save

   end
  it "should update a content with a logged in user" do

    visit edit_content_path @content.slug

    within "form" do
      fill_in "content_name", with: "Video Mongo"
      fill_in "content_content_type", with: "video"		
		  fill_in "content_content", with: "<iframe width=\"420\" height=\"315\" src=\"https://www.youtube.com/embed/rRpSgv1JyOo\" frameborder=\"0\" allowfullscreen></iframe>"
	    check "content_published"
      
    end

    click_link_or_button "Update Content"

    expect( Content.count ).to eq(1)
    expect( Content.first.name).to eq("Video Mongo")
    expect( Content.first.content_type).to eq("video")
    expect( Content.first.content).to eq("<iframe width=\"420\" height=\"315\" src=\"https://www.youtube.com/embed/rRpSgv1JyOo\" frameborder=\"0\" allowfullscreen></iframe>")
    expect( Content.first.published).to eq(true)
    expect( Content.first.user_id).to eq(@user.id)

  end

end
