class AddColumnToLogDatum < ActiveRecord::Migration
  def change
    add_column :log_data, :parameters, :string, limit: 1000
  end
end
