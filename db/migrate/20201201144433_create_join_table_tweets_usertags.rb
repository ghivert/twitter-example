class CreateJoinTableTweetsUsertags < ActiveRecord::Migration[6.0]
  def change
    create_join_table :tweets, :usertags do |t|
      # t.index [:tweet_id, :usertag_id]
      # t.index [:usertag_id, :tweet_id]
    end
  end
end
