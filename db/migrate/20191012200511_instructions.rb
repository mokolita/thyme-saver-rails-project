class Instructions < ActiveRecord::Migration[6.0]
  def change
    create_table :instructions do |t|
      t.integer :plants_users_id 
      t.text :notes
    end 
  end
end
