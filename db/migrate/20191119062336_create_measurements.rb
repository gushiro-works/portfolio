class CreateMeasurements < ActiveRecord::Migration[5.1]
  def change
    create_table :measurements do |t|
      t.references :user, foreign_key: true
      t.string :event
      t.string :unit
      t.string :type

      t.timestamps
    end
    add_index :measurements, [:user_id, :created_at, :event]
  end
end
