json.extract! calendar_link, :id, :title, :url, :created_at, :updated_at
json.url calendar_link_url(calendar_link, format: :json)
