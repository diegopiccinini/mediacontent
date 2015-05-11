json.array!(@media) do |medium|
  json.extract! medium, :id, :name, :content_type, :content, :image, :slug, :share
  json.url medium_url(medium, format: :json)
end
