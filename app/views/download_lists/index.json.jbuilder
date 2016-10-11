json.array!(@download_lists) do |download_list|
  json.extract! download_list, :id, :first_name, :last_name, :email
  json.url download_list_url(download_list, format: :json)
end
