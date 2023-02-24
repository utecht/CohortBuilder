class AddProcessedToField < ActiveRecord::Migration[7.0]
  def change
    add_column :fields, :processed, :boolean, default: false
  end
end
