json.array!(@admin_device_wares) do |admin_device_ware|
  json.extract! admin_device_ware, :id
  json.url admin_device_ware_url(admin_device_ware, format: :json)
end
