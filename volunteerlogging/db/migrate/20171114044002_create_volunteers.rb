class CreateVolunteers < ActiveRecord::Migration[5.1]
  def change
    create_table :volunteers do |t|
      t.integer :volunteerId
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :encrypted_password
      t.date :dateJoined
      t.string :phoneNum
      t.string :volType

      t.timestamps
    end
  end
end
