class CreateTimeentries < ActiveRecord::Migration
  def change
    create_table :timeentries do |t|
      t.time :time
      t.date :date
      t.references :user, index: true
      t.references :contract, index: true

      t.timestamps null: false
    end
    add_foreign_key :timeentries, :users
    add_foreign_key :timeentries, :contracts
  end
end
