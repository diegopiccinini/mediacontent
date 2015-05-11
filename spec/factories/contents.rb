FactoryGirl.define do
  factory :content do
    name "Green Image"
		content_type "image"
		content "MyText"
	
		slug "my_string"
		published true
		user {FactoryGirl.create(:user)}
	  image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'contents', 'images', 'geen.jpg'),'image/jpg') }
  end
  factory :content_video, class: Content do
    name "Video Mongo"
		content_type "video"
		content "<iframe width=\"420\" height=\"315\" src=\"https://www.youtube.com/embed/rRpSgv1JyOo\" frameborder=\"0\" allowfullscreen></iframe>"
	
		slug "video_mongo"
		published true
		user {FactoryGirl.create(:user)}
  end

   factory :not_published, class: Content do
    name "Video Kdenlive"
		content_type "video"
		content "<iframe width=\"420\" height=\"315\" src=\"https://www.youtube.com/embed/nRf6tqu9bVc\" frameborder=\"0\" allowfullscreen></iframe>"
	
		slug "video_kdenlive"
		published false
		user {FactoryGirl.create(:user)}

  end
end
