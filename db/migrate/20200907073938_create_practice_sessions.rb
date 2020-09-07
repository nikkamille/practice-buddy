class CreatePracticeSessions < ActiveRecord::Migration
  def change
    create_table :practice_sessions do |t|
      t.date :date
      t.string :practice_item
      t.string :duration
      t.text :notes
      t.integer :user_id
      t.timestamps
    end
  end
end
