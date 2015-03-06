class AddedCommentToTimeentry < ActiveRecord::Migration
  def change
    change_table(:timeentries) do |t|
      t.text :comment
    end
  end
end
