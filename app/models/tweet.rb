class Tweet < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :usertags
  before_save :update_tags
  before_save :update_usertags

  default_scope { where(deleted_at: nil) }
  scope :active, -> { where(deleted_at: nil) }
  scope :deleted, -> { where.not(deleted_at: nil) }

  def self.all_but_deleted
    Tweet.where(deleted_at: nil)
  end

  def update_tags
    self.tags = extract_hashtags
  end

  def update_usertags
    self.usertags = extract_usertags
  end

  private

  def extract_hashtags
    content.split(' ').filter do |word|
      word.start_with?('#')
    end.map do |hashtag|
      fetched = Tag.find_by(label: hashtag)
      fetched || Tag.create(label: hashtag)
    end
  end

  def find_user_by_mention(mention)
    username = mention.delete_prefix('@')
    mentionned_user = User.find_by(username: username)
    if mentionned_user
      fetched = Usertag.find_by(user_id: mentionned_user.id)
      return fetched || Usertag.create(user: mentionned_user)
    end
  end

  def extract_usertags
    content.split(' ').filter do |word|
      word.start_with?('@')
    end.map do |mention|
      find_user_by_mention(mention)
    end.filter do |user|
      user != nil
    end
  end
end
