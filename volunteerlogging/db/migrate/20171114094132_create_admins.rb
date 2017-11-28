class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.integer :admin_id
      t.string :firstName
      t.string :lastName
     
     
      t.date :dateJoined
      t.string :phoneNum

      t.timestamps
    end
  end
end
