json.array!(@responses) do |response|
  json.extract! response, :id, :vote_count, :body, :verdict, :created_at, :updated_at
  json.url response_url(response, format: :json)
end
