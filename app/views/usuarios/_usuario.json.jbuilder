json.extract! usuario, :id, :email, :nome, :role, :tipo_skill_id, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
