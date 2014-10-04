json.array!(@drugs) do |drug|
  json.extract! drug, :id, :name, :name_key, :company, :phase, :last_modified, :change_date, :added_date
  json.url drug_url(drug, format: :json)
end
