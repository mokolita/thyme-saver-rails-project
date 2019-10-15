class UpdateColumnNamesForPlantsUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :plants_users, :plants_id, :plants_id
    rename_column :plants_users, :users_id, :user_id
  end
end
