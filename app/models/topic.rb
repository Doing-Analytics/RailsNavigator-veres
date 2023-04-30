class Topic < ApplicationRecord
  has_many :topic_articles
  has_many :articles, through: :topic_articles
  has_many :categories

  has_many :topic_tags
  has_many :tags, through: :topic_tags
end
