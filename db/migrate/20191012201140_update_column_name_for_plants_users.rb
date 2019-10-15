class UpdateColumnNameForPlantsUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :plants_users, :plants_id, :plant_id
  end
end
