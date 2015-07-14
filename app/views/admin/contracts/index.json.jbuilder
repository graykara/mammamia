json.array!(@admin_contracts) do |admin_contract|
  json.extract! admin_contract, :id
  json.url admin_contract_url(admin_contract, format: :json)
end
