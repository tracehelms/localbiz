json.array!(@businesses) do |business|
  json.extract! business, :name, :category
  json.url business_url(business, format: :json)
end
