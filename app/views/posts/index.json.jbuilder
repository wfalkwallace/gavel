json.array!(@posts) do |post|
  json.extract! post, :id, :complaint, :defense, :created_at, :updated_at
  json.url post_url(post, format: :json)
end
