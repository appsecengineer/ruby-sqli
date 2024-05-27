json.extract! to_do, :id, :name, :remarks, :date_to_be_completed, :private, :created_at, :updated_at
json.url to_do_url(to_do, format: :json)
