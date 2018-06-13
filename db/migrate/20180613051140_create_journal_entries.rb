class CreateJournalEntries < ActiveRecord::Migration
  def change
    create_table :journal_entries do |t|
      t.float :work_hours_per_day
      t.float :sleep_hours_per_day
      t.integer :social_connections_per_day
      t.integer :user_id

      t.timestamps

    end
  end
end
