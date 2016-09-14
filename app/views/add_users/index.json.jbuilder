json.array!(@add_users) do |add_user|
  json.extract! add_user, :id
  json.url add_user_url(add_user, format: :json)
end
