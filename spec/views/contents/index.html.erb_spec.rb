require 'rails_helper'

RSpec.describe "contents/index", type: :view do
  before(:each) do
    assign(:contents, [
      Content.create!(
        :name => "Name",
        :content_type => "Content Type",
        :content => "MyText",
        :image => "",
        :slug => "Slug",
        :published => false,
        :user => nil
      ),
      Content.create!(
        :name => "Name",
        :content_type => "Content Type",
        :content => "MyText",
        :image => "",
        :slug => "Slug",
        :published => false,
        :user => nil
      )
    ])
  end

  it "renders a list of contents" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Content Type".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
