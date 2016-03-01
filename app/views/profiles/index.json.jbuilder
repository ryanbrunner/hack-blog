json.array!(@profiles) do |profile|
  json.extract! profile, :id, :date_of_birth, :gender
  json.url profile_url(profile, format: :json)
end
