json.extract! event, :id, :title, :image, :description, :date, :slug, :created_at, :updated_at
json.url event_url(event, format: :json)
