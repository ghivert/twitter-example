class AddNotificationsEnabledToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :notifications_enabled, :boolean, default: true
  end
end
