class AddDefaultValueToPlants < ActiveRecord::Migration[6.0]
  def change
    change_column :plants, :perennial, :boolean, default: false
  end
end
