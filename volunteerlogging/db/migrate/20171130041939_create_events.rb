class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :start_time
      t.datetime :end_time

      t.integer :numOfSections
      t.bigint :repeated_id, :default => 0
      t.timestamps
    end
  end
end
