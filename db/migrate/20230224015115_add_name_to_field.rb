class AddNameToField < ActiveRecord::Migration[7.0]
  def change
    add_column :fields, :name, :string
  end
end
