require 'rails_helper'

RSpec.describe "contents/edit", type: :view do
  before(:each) do
    @content = assign(:content, Content.create!(FactoryGirl.attributes_for(:content)))
  end

  it "renders the edit content form" do
    render

    assert_select "form[action=?][method=?]", content_path(@content), "post" do

      assert_select "input#content_name[name=?]", "content[name]"

      assert_select "input#content_content_type[name=?]", "content[content_type]"

      assert_select "textarea#content_content[name=?]", "content[content]"

      assert_select "input#content_image[name=?]", "content[image]"

      assert_select "input#content_published[name=?]", "content[published]"


    end
  end
end
