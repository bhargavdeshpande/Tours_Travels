json.extract! login, :id, :name, :email, :password, :role, :created_at, :updated_at
json.url login_url(login, format: :json)
