class CreateJoinTableTagsTweets < ActiveRecord::Migration[6.0]
  def change
    create_join_table :tags, :tweets do |t|
      # t.index [:tag_id, :tweet_id]
      # t.index [:tweet_id, :tag_id]
    end
  end
end
