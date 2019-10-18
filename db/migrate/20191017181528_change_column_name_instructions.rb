class ChangeColumnNameInstructions < ActiveRecord::Migration[6.0]
  def change
    rename_column :instructions, :plants_users_id, :plants_user_id
  end
end
