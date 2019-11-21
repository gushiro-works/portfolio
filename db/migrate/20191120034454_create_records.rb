class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.references :user, foreign_key: true
      t.references :measurement, foreign_key: true
      t.integer :record_value

      t.timestamps
    end
  end
  #add_index :records, [:user, :measurement]
end
