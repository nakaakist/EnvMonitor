class CreateAcclogs < ActiveRecord::Migration
  def change
    create_table :acclogs do |t|
      t.datetime :aq_time
      t.float :a_x
      t.float :a_y
      t.float :a_z
      t.timestamps null: false
    end
  end
end
