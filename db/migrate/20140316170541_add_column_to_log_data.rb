class AddColumnToLogData < ActiveRecord::Migration
  def change
    add_column :log_data, :prettyTime, :string, limit: 50
  end
end
