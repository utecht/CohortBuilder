class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :patient_id
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
