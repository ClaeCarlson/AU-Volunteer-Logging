json.extract! admin, :id, :adminId, :firstName, :lastName, :email, :encrypted_password, :dateJoined, :phoneNum, :created_at, :updated_at
json.url admin_url(admin, format: :json)
