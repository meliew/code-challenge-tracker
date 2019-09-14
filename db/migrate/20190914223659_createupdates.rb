class Createupdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
    t.integer :challenge_id
    t.string :log
    t.date :log_date
    t.integer :log_number
    end
  end
end
