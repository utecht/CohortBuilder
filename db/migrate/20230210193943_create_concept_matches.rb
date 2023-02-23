class CreateConceptMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :concept_matches do |t|
      t.references :concept, null: false, foreign_key: true
      t.references :option, null: false, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
