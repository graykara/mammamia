json.array!(@admin_device_codes) do |admin_device_code|
  json.extract! admin_device_code, :id
  json.url admin_device_code_url(admin_device_code, format: :json)
end
