class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :hours
      t.decimal :wage
      t.date :start_date
      t.date :end_date
      t.string :client
      t.string :comment
      t.references :user

      t.timestamps null: false
    end
  end
end
