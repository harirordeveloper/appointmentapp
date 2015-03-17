json.array!(@events) do |appointment|
  json.extract! appointment, :id, :title,:start,:end
  json.url appointment_url(appointment[:id], format: :html)
  # json.title appointment.name
  #  json.description appointment.reason
  # json.start appointment.start
  # json.end appointment.end
  # json.rendering 'background'
end
