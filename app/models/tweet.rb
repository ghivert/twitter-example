class Tweet < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags
  before_save :set_tags

  def extract_hashtags
    self.content.split(' ').filter do |elem|
      elem.start_with?('#')
    end
  end

  def get_hashtags_models(hashtags)
    tags_return = []
    for tag in hashtags
      fetched_tag = Tag.find_by(label: tag)
      if fetched_tag
        tags_return.push(fetched_tag)
      else
        new_tag = Tag.create(label: tag)
        tags_return.push(new_tag)
      end
    end
    tags_return
  end

  def set_tags
    hashtags = extract_hashtags
    # Lire les tags pour récupérer le tag correspondant en base de données
    new_tags = get_hashtags_models(hashtags)
    # Lier les deux Tweet <-> Tag
    self.tags = new_tags
  end
end
