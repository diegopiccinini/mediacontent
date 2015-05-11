FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    password "12345678arr"
    password_confirmation "12345678arr" 

    factory :admin do
      after(:create) {|user| user.add_role(:admin)}
    end
  end

end
