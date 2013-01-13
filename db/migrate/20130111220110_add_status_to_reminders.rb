class AddStatusToReminders < ActiveRecord::Migration
  def up
    add_column :reminders, :status, :string, :default => "new"
  end

  def down
    remove_column :reminders, :status
  end
end
