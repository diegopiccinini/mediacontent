require 'rails_helper'

RSpec.describe "contents/index", type: :view do
  before(:each) do
    assign(:contents, [
      Content.create!(FactoryGirl.attributes_for(:content)),
      Content.create!(FactoryGirl.attributes_for(:content2)),
      Content.create!(FactoryGirl.attributes_for(:content3))
    ])
  end

  it "renders a list of contents" do
    content=FactoryGirl.create(:content) 
    content2=FactoryGirl.create(:content2) 
    render
    assert_select "tr>td", :text => content.name.to_s, :count => 1
    assert_select "tr>td", :text => content2.name.to_s, :count => 1
    assert_select "tr>td", :text => content.content_type.to_s, :count => 1
    assert_select "tr>td", :text => content2.content_type.to_s, :count => 1
    assert_select "tr>td", :text => content.content.to_s, :count => 1
    assert_select "tr>td", :text => content2.content_type.to_s  , :count => 1

    assert_select "tr>td", :text => content.slug.to_s  , :count => 1
    assert_select "tr>td", :text => content2.slug.to_s  , :count => 1
    assert_select "tr>td", :text => content3.slug.to_s  , :count => 0

  end
end
