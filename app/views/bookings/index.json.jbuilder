json.array!(@bookings) do |booking|
  json.extract! booking, :id, :name, :email, :phone, :pax, :pickup, :destiny, :hour, :ondate
  json.url booking_url(booking, format: :json)
end
