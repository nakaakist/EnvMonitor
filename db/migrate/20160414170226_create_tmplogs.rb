class CreateTmplogs < ActiveRecord::Migration
  def change
    create_table :tmplogs do |t|
      t.datetime :aq_time
      t.float :temperature
      t.timestamps null: false
    end
  end
end
