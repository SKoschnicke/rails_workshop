json.array!(@timeentries) do |timeentry|
  json.extract! timeentry, :id, :time, :date, :user_id, :contract_id
  json.url timeentry_url(timeentry, format: :json)
end
