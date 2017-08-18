class AddHomeLocationToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :home_location, :string
  end
end
