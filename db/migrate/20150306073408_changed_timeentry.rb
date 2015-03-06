class ChangedTimeentry < ActiveRecord::Migration
  def change
    change_table(:timeentries) do |t|
      t.integer :duration
    end
    remove_column :timeentries, :time
  end
end
