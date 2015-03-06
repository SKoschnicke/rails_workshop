json.array!(@contracts) do |contract|
  json.extract! contract, :id, :hours, :wage, :start_date, :end_date, :client, :comment
  json.url contract_url(contract, format: :json)
end
