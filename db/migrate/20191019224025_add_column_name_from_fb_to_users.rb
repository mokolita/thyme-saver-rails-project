class AddColumnNameFromFbToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name_from_fb, :string
  end
end
