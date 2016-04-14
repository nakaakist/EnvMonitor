class CreateEnvlogs < ActiveRecord::Migration
  def change
    create_table :envlogs do |t|
      t.datetime :aq_time
      t.float :a_x
      t.float :a_y
      t.float :a_z
      t.float :temperature
      t.timestamps null: false
    end
  end
end
