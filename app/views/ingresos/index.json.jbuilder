json.array!(@ingresos) do |ingreso|
  json.extract! ingreso, :id, :producto_id, :user_id, :cantidad
  json.url ingreso_url(ingreso, format: :json)
end
