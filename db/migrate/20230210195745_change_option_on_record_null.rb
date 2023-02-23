class ChangeOptionOnRecordNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:records, :option_id, true)
  end
end
