json.array!(@contents) do |content|
  json.extract! content, :id, :name, :content_type, :content, :image, :slug, :published, :user_id
  json.url content_url(content, format: :json)
end
