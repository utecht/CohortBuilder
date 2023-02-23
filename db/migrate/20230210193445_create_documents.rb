class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.text :preview
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
