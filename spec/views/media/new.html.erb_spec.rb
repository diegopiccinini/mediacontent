require 'rails_helper'

RSpec.describe "media/new", type: :view do
  before(:each) do
    assign(:medium, Medium.new(
      :name => "MyString",
      :content_type => "MyString",
      :content => "MyText",
      :image => "",
      :slug => "MyString",
      :share => false
    ))
  end

  it "renders new medium form" do
    render

    assert_select "form[action=?][method=?]", media_path, "post" do

      assert_select "input#medium_name[name=?]", "medium[name]"

      assert_select "input#medium_content_type[name=?]", "medium[content_type]"

      assert_select "textarea#medium_content[name=?]", "medium[content]"

      assert_select "input#medium_image[name=?]", "medium[image]"

      assert_select "input#medium_slug[name=?]", "medium[slug]"

      assert_select "input#medium_share[name=?]", "medium[share]"
    end
  end
end
