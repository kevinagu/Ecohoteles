json.array!(@recibidos) do |recibido|
  json.extract! recibido, :id, :ropa_id, :cantidad, :rotas, :manchada, :procedencia, :user_id
  json.url recibido_url(recibido, format: :json)
end
