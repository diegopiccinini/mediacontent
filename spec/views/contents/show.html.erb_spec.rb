require 'rails_helper'

RSpec.describe "contents/show", type: :view do
  before(:each) do
    @content = assign(:content, Content.create!(FactoryGirl.attributes_for(:content)
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Content type/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
