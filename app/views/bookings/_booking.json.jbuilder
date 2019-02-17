json.extract! booking, :id, :status, :seatsToBook, :created_at, :updated_at
json.url booking_url(booking, format: :json)
