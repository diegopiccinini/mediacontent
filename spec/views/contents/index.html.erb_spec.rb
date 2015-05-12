require 'rails_helper'

RSpec.describe "contents/index", type: :view do
  before(:each) do
    assign(:contents, [
      Content.create!(FactoryGirl.attributes_for(:content)),
      Content.create!(FactoryGirl.attributes_for(:content_video)),
      Content.create!(FactoryGirl.attributes_for(:not_published))
    ])
  end

  it "renders a list of contents" do
    content=FactoryGirl.create(:content) 
    content_video=FactoryGirl.create(:content_video) 
    conten_not_published =Content.create!(FactoryGirl.attributes_for(:not_published))

    render
    assert_select "tr>td", :text => content.name.to_s, :count => 1
    assert_select "tr>td", :text => content_video.name.to_s, :count => 1
    assert_select "tr>td", :text => content.content_type.to_s, :count => 1

    assert_select "tr>td", :text => content_video.content.to_s, :count => 1
    assert_select "tr>td", :text => conten_not_published.content.to_s, :count => 0
  end
end
