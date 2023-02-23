class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.string :type
      t.references :patient, null: false, foreign_key: true
      t.references :field, null: false, foreign_key: true
      t.string :string_value
      t.references :option, null: false, foreign_key: true
      t.integer :int_value
      t.float :float_value
      t.date :date_value

      t.timestamps
    end
  end
end
