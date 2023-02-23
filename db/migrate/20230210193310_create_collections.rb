class CreateCollections < ActiveRecord::Migration[7.0]
  def change
    create_table :collections do |t|
      t.string :name
      t.string :nbia_link

      t.timestamps
    end
  end
end
