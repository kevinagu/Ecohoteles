json.array!(@ropas) do |ropa|
  json.extract! ropa, :id, :nombre, :recibido, :rotas, :manchada, :disponible, :cantidad
  json.url ropa_url(ropa, format: :json)
end
