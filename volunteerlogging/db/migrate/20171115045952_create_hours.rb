class CreateHours < ActiveRecord::Migration[5.1]
  def change
    create_table :hours do |t|
      t.integer :hour_id
      t.decimal :hoursWorked
      t.date :weekWorked

      t.bigint :section_id
      t.belongs_to :section, index: true
      
      t.integer :volunteer_id
      t.belongs_to :volunteer, index: true

      t.timestamps
    end
  end
end
