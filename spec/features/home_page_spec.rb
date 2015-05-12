require 'rails_helper'

RSpec.feature "HomePage", type: :feature do

  it "should view contents#index" do

    visit root_path

    html.should include("Welcome to media contents")

  end
end
