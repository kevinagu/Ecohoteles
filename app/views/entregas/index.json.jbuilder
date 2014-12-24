json.array!(@entregas) do |entrega|
  json.extract! entrega, :id, :ropa_id, :cantidad, :rotas, :manchada, :destino, :user_id
  json.url entrega_url(entrega, format: :json)
end
