class AddStationNameToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :station_name, :string
  end
end
