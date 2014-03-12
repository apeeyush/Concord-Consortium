class CreateLogData < ActiveRecord::Migration
  def change
    create_table :log_data do |t|
      t.string :session
      t.datetime :time
      t.integer :timeDrift
      t.string :event

      t.timestamps
    end
  end
end
