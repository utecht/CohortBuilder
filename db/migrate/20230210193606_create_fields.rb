class CreateFields < ActiveRecord::Migration[7.0]
  def change
    create_table :fields do |t|
      t.string :type
      t.json :example
      t.json :stats
      t.text :description
      t.references :document, null: false, foreign_key: true

      t.timestamps
    end
  end
end
