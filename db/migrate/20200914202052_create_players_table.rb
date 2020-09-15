class CreatePlayersTable < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :player_name
      t.integer :number
      t.integer :team_id
    end
  end
end
