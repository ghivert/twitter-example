class Tag < ApplicationRecord
  has_and_belongs_to_many :tweets
  # label: string
end
