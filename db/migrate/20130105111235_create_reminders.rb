class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.integer :user_id
      t.string :movie_title_id
      t.timestamps
    end
  end
end
