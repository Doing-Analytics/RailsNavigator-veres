class Blog < ApplicationRecord
  belongs_to :user
  has_many :blog_articles
  has_many :articles, through: :blog_articles
  has_many :categories
end
