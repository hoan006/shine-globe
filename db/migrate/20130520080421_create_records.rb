class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :timestamp
      t.integer :point
      t.integer :step
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
