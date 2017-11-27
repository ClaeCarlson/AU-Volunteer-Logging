class CreateVolunteerDescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :volunteer_descriptions do |t|
      t.integer :volunteer_id
      t.string :infoVolunteer
      t.date :datesAvail

      t.belongs_to :volunteer , index:true
      t.timestamps
    end
  end
end
