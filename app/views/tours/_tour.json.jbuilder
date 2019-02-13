json.extract! tour, :id, :name, :description, :price, :deadline, :startDate, :endDate, :totalSeats, :availableSeats, :contactInfo, :created_at, :updated_at
json.url tour_url(tour, format: :json)
