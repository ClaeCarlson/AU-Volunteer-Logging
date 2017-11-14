class CreateVolunteerDescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :volunteer_descriptions do |t|
      t.integer :volunteerId
      t.string :infoVolunteer
      t.date :datesAvail

      t.timestamps
    end
  end
end
