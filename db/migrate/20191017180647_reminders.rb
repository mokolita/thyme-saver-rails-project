class Reminders < ActiveRecord::Migration[6.0]
  def change
    create_table :reminders do |t|
      t.integer :instruction_id 
      t.integer :interval
      t.string :comment
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end
end
