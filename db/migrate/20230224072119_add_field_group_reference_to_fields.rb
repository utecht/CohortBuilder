class AddFieldGroupReferenceToFields < ActiveRecord::Migration[7.0]
  def change
    add_reference :fields, :field_group
  end
end
