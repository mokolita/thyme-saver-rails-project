class Plants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :common_name 
      t.string :scientific_name
      t.integer :api_id
      t.string :photo
      t.boolean :perennial
    end 

  end
end
