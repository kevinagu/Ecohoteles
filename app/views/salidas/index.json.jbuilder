json.array!(@salidas) do |salida|
  json.extract! salida, :id, :producto_id, :user_id, :cantidad
  json.url salida_url(salida, format: :json)
end
