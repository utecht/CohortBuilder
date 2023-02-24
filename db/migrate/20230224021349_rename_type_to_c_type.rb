class RenameTypeToCType < ActiveRecord::Migration[7.0]
  def change
    rename_column :fields, :type, :ctype
  end
end
