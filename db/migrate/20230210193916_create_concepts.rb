class CreateConcepts < ActiveRecord::Migration[7.0]
  def change
    create_table :concepts do |t|
      t.string :obo_class
      t.string :label
      t.text :definition
      t.text :rdf_template

      t.timestamps
    end
  end
end
