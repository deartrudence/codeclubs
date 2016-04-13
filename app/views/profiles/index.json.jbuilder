json.array!(@profiles) do |profile|
  json.extract! profile, :id, :first_name, :last_name, :school, :role, :grade, :mailing_list
  json.url profile_url(profile, format: :json)
end
