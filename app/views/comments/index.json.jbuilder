json.array!(@comments) do |comment|
  json.extract! comment, :id, :votes, :created_at, :updated_at, :body
  json.url comment_url(comment, format: :json)
end
