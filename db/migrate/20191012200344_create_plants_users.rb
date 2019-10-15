class CreatePlantsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :plants_users do |t|
      t.integer :plants_id
      t.integer :users_id
      t.string :status
      t.timestamps
    end
  end
end
