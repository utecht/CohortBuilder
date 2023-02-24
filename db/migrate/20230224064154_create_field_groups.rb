class CreateFieldGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :field_groups do |t|
      t.string :name
      t.text :description
      t.references :document, null: false, foreign_key: true

      t.timestamps
    end
  end
end
