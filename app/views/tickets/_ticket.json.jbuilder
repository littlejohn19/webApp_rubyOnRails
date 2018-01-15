json.extract! ticket, :id, :user_id, :event_id, :name, :address, :price, :email_address, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
