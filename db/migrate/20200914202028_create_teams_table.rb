class CreateTeamsTable < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :team_name
      t.string :sport
      t.string :league
      t.string :coach
    end
  end
end
