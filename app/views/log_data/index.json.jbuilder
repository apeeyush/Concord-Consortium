json.array!(@log_data) do |log_datum|
  json.extract! log_datum, :id, :session, :time, :timeDrift, :event
  json.url log_datum_url(log_datum, format: :json)
end
