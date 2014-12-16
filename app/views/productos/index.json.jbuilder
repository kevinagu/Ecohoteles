json.array!(@productos) do |producto|
  json.extract! producto, :id, :nombre, :marca, :umedida_id, :pcosto, :pventa, :cantidad, :stock, :seccion_id
  json.url producto_url(producto, format: :json)
end
