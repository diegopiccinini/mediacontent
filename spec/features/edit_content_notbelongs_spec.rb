require 'rails_helper'

RSpec.feature "EditContentNotBelongs", type: :feature do
   before do
    @user = FactoryGirl.create(:user)
    login_as @user
    @user2 = FactoryGirl.create(:user)
    @content= FactoryGirl.create(:content)
    @content.user_id=@user2.id
    @content.save

   end
  it "should be redirected to 422.html" do

    visit edit_content_path @content.slug
    expect(current_path).to eql('/422.html')

  end

end
