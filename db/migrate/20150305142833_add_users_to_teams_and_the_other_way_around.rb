class AddUsersToTeamsAndTheOtherWayAround < ActiveRecord::Migration
  def change
    create_join_table :teams, :users do |t|
      t.index :team_id
      t.index :user_id
    end
  end
end
