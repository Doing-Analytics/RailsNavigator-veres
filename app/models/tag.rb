class Tag < ApplicationRecord
  has_many :article_tags
  has_many :articles, through: :article_tags

  has_many :topic_tags
  has_many :topics, through: :topic_tags

  enum :tag_type, %i[topic article]
end
