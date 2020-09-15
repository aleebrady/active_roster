class AddPositionColumn < ActiveRecord::Migration
  def change
    add_column :players, :position, :string 
  end
end
