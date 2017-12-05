class CreateEventRepeateds < ActiveRecord::Migration[5.1]
  def change
    create_table :event_repeateds do |t|

      t.bigint :event_id
      
      t.date :startDate
      t.date :endDate

      t.string :dow
      
    end
  end
end
