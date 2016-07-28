json.array!(@facebook_images) do |facebook_image|
  json.extract! facebook_image, :id, :name
  json.url facebook_image_url(facebook_image, format: :json)
end
