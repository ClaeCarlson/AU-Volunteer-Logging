class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.integer :adminId
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :encrypted_password
      t.date :dateJoined
      t.string :phoneNum

      t.timestamps
    end
  end
end
