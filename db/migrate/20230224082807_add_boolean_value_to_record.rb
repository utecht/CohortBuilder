class AddBooleanValueToRecord < ActiveRecord::Migration[7.0]
  def change
    add_column :records, :boolean_value, :boolean
  end
end
