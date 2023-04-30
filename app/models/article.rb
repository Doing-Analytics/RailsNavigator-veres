class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :blog_articles
  has_many :blogs, through: :blog_articles
  has_many :topic_articles
  has_many :topics, through: :topic_articles
  has_many :article_tags
  has_many :tags, through: :article_tags
end
