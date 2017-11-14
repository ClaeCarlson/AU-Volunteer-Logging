class CreateHours < ActiveRecord::Migration[5.1]
  def change
    create_table :hours do |t|
      t.integer :hoursId
      t.decimal :hoursWorked
      t.date :weekWorked
      t.integer :volunteerId

      t.timestamps
    end
  end
end
