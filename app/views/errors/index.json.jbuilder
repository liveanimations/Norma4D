json.array!(@errors) do |error|
  json.extract! error, :id, :message, :stack_trace, :type
  json.url error_url(error, format: :json)
end
