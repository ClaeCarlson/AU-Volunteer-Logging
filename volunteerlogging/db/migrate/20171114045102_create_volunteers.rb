class CreateVolunteers < ActiveRecord::Migration[5.1]
  def change
    create_table :volunteers do |t|
      t.integer :volunteer_id
      t.string :firstName
      t.string :lastName
    
      t.date :dateJoined
      t.string :phoneNum
      t.string :volType

      t.timestamps
    end
  end
end
