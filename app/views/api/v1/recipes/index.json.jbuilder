json.paging do
  json.extract! @pagy_metadata, :next_url, :count
end

json.data do
  json.array! @recipes
end
