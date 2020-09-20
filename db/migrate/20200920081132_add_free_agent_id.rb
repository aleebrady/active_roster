class AddFreeAgentId < ActiveRecord::Migration
  def change
    add_column :teams, :free_agent_ids, :integer
  end
end
