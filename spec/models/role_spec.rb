require 'rails_helper'

RSpec.describe Role, type: :model do
	context "when a user has a role admin" do
	  before { @user = FactoryGirl.create :admin }
	  subject { @user }

	  it { expect(@user.has_role? :admin).to be_truthy }
	end

end
