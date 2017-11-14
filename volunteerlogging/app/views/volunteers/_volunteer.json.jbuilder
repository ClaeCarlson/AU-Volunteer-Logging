json.extract! volunteer, :id, :volunteerId, :firstName, :lastName, :email, :encrypted_password, :dateJoined, :phoneNum, :volType, :created_at, :updated_at
json.url volunteer_url(volunteer, format: :json)
