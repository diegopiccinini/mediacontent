require 'rails_helper'

RSpec.describe "media/index", type: :view do
  before(:each) do
    assign(:media, [
      Medium.create!(
        :name => "Name",
        :content_type => "Content Type",
        :content => "MyText",
        :image => "",
        :slug => "Slug",
        :share => false
      ),
      Medium.create!(
        :name => "Name",
        :content_type => "Content Type",
        :content => "MyText",
        :image => "",
        :slug => "Slug",
        :share => false
      )
    ])
  end

  it "renders a list of media" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Content Type".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
