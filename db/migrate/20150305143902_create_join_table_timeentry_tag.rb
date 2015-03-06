class CreateJoinTableTimeentryTag < ActiveRecord::Migration
  def change
    create_join_table :timeentries, :tags do |t|
      # t.index [:timeentry_id, :tag_id]
      # t.index [:tag_id, :timeentry_id]
    end
  end
end
