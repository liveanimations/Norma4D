json.array!(@notifications) do |notification|
  json.extract! notification, :id, :name, :text, :application_id
  json.url notification_url(notification, format: :json)
end
