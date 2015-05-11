FactoryGirl.define do
  factory :content do
    name "MyString"
		content_type "image"
		content "MyText"
	
		slug "my_string"
		published false
		user {FactoryGirl.create(:user)}
	  image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'contents', 'images', 'geen.jpg'),'image/jpg') }
  end
  factory :content2, class: Content do
    name "MyString2"
		content_type "video"
		content "<iframe width=\"420\" height=\"315\" src=\"https://www.youtube.com/embed/rRpSgv1JyOo\" frameborder=\"0\" allowfullscreen></iframe>"
	
		slug "my_string2"
		published false
		user {FactoryGirl.create(:user)}
	  image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'contents', 'images', 'geen.jpg'),'image/jpg') }
  end
end
