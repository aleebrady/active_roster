class AddTeamPlayerId < ActiveRecord::Migration
  def change
    add_column :teams, :team_player_ids, :integer
  end
end
