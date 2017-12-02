class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.integer :event_section 
      
      t.datetime :start
      t.datetime :end
      
      t.bigint :event_id
      t.belongs_to :event, index: true 
      t.timestamps
    end
  end
end
