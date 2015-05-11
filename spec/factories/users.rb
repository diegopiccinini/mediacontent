FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    password "12345678arr"
    password_confirmation "12345678arr" 
  end

end
