class AddFullNameToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :fullName, :string
  end
end
