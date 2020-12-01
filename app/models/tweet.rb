class Tweet < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags
  before_save :update_tags

  def update_tags
    self.tags = extract_hashtags
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
end
