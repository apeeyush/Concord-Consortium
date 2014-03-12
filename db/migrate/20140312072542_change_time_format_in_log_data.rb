class ChangeTimeFormatInLogData < ActiveRecord::Migration
  def change
    change_column :log_data, :time, :bigint
  end
end