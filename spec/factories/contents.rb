FactoryGirl.define do
  factory :content do
    name "MyString"
		content_type "MyString"
		content "MyText"
	
		slug "MyString"
		published false
		user nil
	  image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'contents', 'images', 'geen.jpg'),'image/jpg') }
  end

end
