class AddDeletedAtToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :deleted_at, :timestamp
  end
end
