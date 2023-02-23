class CreateOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :options do |t|
      t.references :field, null: false, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
