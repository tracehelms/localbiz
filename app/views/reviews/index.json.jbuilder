json.array!(@reviews) do |review|
  json.extract! review, :content, :rating
  json.url review_url(review, format: :json)
end
